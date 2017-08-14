<%--
  Created by IntelliJ IDEA.
  User: Brahmastra
  Date: 8/6/2017
  Time: 11:24 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>

    <title>
        ${myList}
    </title>
</head>

<body>
    <table>
        <tbody>
            %{--<th><td>Name</td><td>Quantity</td><td>Price</td></th>--}%
            <g:each in="${myList}" var="list" status="index">
                <tr><td>${list.name}</td><td>${list.quantity}</td><td>${list.totalPrice}</td></tr>
                <g:if test="${index ==myList.size()-1}">
                    Grand Total Price: <g:dwitNumberFormat number="${list.grandTotalPrice}" format="Rs##0.00"/>
                </g:if>

            </g:each>
        </tbody>
    </table>
</body>
</html>