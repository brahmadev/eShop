package eshop

import org.apache.tomcat.jni.File
import org.json.simple.JSONArray
import org.json.simple.parser.JSONParser
import org.springframework.dao.DataIntegrityViolationException
import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile

class ProductController extends BaseController{

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }
    def productDetails(){

        [productList:Product.listOrderByCategory()]
    }
    def showCart(){

    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [productInstanceList: Product.list(params), productInstanceTotal: Product.count()]
    }

    def create() {
        [productInstance: new Product(params)]
    }

    def save() {
        upload(params)
        def productInstance = new Product(params)
        if (!productInstance.save(flush: true)) {
            render(view: "create", model: [productInstance: productInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'product.label', default: 'Product'), productInstance.id])
        redirect(action: "show", id: productInstance.id)
    }

    def show(Long id) {
        def productInstance = Product.get(id)
        println productInstance.imagePath+"-------------------"
        if (!productInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'product.label', default: 'Product'), id])
            redirect(action: "list")
            return
        }

        [productInstance: productInstance]
    }

    def edit(Long id) {
        def productInstance = Product.get(id)
        if (!productInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'product.label', default: 'Product'), id])
            redirect(action: "list")
            return
        }

        [productInstance: productInstance]
    }

    def update(Long id, Long version) {
        def productInstance = Product.get(id)
        if (!productInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'product.label', default: 'Product'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (productInstance.version > version) {
                productInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'product.label', default: 'Product')] as Object[],
                          "Another user has updated this Product while you were editing")
                render(view: "edit", model: [productInstance: productInstance])
                return
            }
        }
        if(getFile().getOriginalFilename()){
            upload(params)
        }else{
            params.remove("imagePath")
        }

        productInstance.properties = params

        if (!productInstance.save(flush: true)) {
            render(view: "edit", model: [productInstance: productInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'product.label', default: 'Product'), productInstance.id])
        redirect(action: "show", id: productInstance.id)
    }

    def delete(Long id) {
        def productInstance = Product.get(id)
        if (!productInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'product.label', default: 'Product'), id])
            redirect(action: "list")
            return
        }

        try {
            productInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'product.label', default: 'Product'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'product.label', default: 'Product'), id])
            redirect(action: "show", id: id)
        }
    }
    private void upload(def params){
        final String path=grailsApplication.mainContext.servletContext.getRealPath('')
        CommonsMultipartFile file=getFile()
        if(file) {
            file.transferTo new java.io.File(path + "/images/products/${file.getOriginalFilename()}")
            params.remove('image')
            params.imagePath = file.getOriginalFilename()
        }
    }
    private void deleteFile(String file) {
        final String path=  grailsApplication.mainContext.servletContext.getRealPath('')+"/images/products/"+file
        new File (path).delete()
        println "file deleted!!------>" +path

    }
    private CommonsMultipartFile getFile() {
        MultipartHttpServletRequest mpr = (MultipartHttpServletRequest) request;
        CommonsMultipartFile file = (CommonsMultipartFile) mpr.getFile("image");
        file
    }
    def search={
        def category = Category.findByName(params.name)
        // def books = author ? Book.findAllByAuthor(author) : []
        render(view:'productDetails', model:[ productList:
                                                      category ? Product.findAllByCategory(category):[]])
    }
    def searchBar={
        render(view: 'productDetails',model: [productList: Product.findAllByNameLikeOrManufacturerLike('%'+params.name+'%','%'+params.name+'%')])
    }
    def beforeInterceptor=[action: this.&auth,except:['productDetails','showCart','searchBar','search','sendEmail']]
    def groovyPageRenderer
    def mailService
    def sendEmail() {

        mailService.sendMail {
            String jsonCartData= params.cartData;
            JSONParser parser = new JSONParser();
            JSONArray array = (JSONArray)parser.parse(jsonCartData);
            def content= groovyPageRenderer.render(view:'/product/myTemplate',model: [myList: array]);
            to "vedmasb@gmail.com"
            subject "This is a test mail"
//            body bodyString;
            html (content);
        }

        forward(action: 'productDetails')
    }
}
