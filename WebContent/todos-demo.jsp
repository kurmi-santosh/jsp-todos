<%@ page import="java.util.*" %>

<html>
    <body>
        <!-- Step 1: Create HTML form -->
        <form action="todos-demo.jsp">
            Add new item: <input type="text" name="todoItem" />

            <input type="submit" value="Submit" />
        </form>

        <!-- Step 2: Add new item to todo list -->
        <%
            // get the TO DO items from the session
            List<String> items = (List<String>) session.getAttribute("myToDoList");

            // if no todos list , then create a new one
            if (items == null) {
                items = new ArrayList<String>();
                session.setAttribute("myToDoList", items);
            }

            // see if there is form data to add
            String theItem = request.getParameter("todoItem");

            if ((theItem != null) && (!theItem.trim().equals(""))) {
               items.add(theItem);
            }
        %>

        <!-- Step 3: Display all todo items from session -->
        <hr>
        <b>To List Items:</b> <br/>

        <ol>
        <%
            for (String temp : items) {
                out.println("<li>" + temp + "</li>");
            }
        %>
        </ol>

    </body>

</html>