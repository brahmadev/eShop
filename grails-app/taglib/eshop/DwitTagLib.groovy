package eshop

class DwitTagLib {
    def dwitNumberFormat={attrs ->
        def number=attrs.get('number')

        if(!number){
            number =new Double(0)
        }
        def format=attrs.get('format')
        if(!format){
            format="0"
        }
        out << new java.text.DecimalFormat(format).format((Double)number)


    }

}
