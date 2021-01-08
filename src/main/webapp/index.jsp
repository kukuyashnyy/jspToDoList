<%@ page import="java.util.HashMap" %>
<%@ page pageEncoding="utf-8" contentType="text/html; utf-8; charset=UTF-8" language="java" %>

<html>
<body>
<%!
    Integer id = 0;
    HashMap<Integer, String[]> tasks = new HashMap<Integer, String[]>();
%>
<%
    request.setCharacterEncoding("UTF-8");

    String name = request.getParameter("name");
    String description = request.getParameter("description");
    if(name != null) {
        if (!name.isEmpty()) {
            String[] data = {name, description};
            tasks.put(id++, data);
        }
    }

    if (request.getParameter("id") != null) {
        Integer id = Integer.parseInt(request.getParameter("id"));
        tasks.remove(id);
    }
%>
<h2>To Do List</h2>
<form method="post">
    <label>
        Task name:
        <input type="text" name="name" />
    </label>
    <label>
        Description:
        <input type="text" name="description" />
    </label>
    <input type="submit" />
</form>
<table border="1">
    <tr>
        <th style="width: 25px">ID</th>
        <th style="width: 450px">Name</th>
        <th style="width: 450px">Description</th>
        <th>Action</th>
    </tr>
    <%
        response.setCharacterEncoding("UTF-8");
        if (!tasks.isEmpty()) {
            for (Integer key : tasks.keySet()){
                out.println("<tr>");
                out.println("<td>" + key + "</td>");
                for (String str : tasks.get(key)) {
                    out.println("<td>" + str + "</td>");
                }
                out.println("<td>");
                out.println("<form method='post'>\n");
                out.println("<input type='hidden' name='id' value='" + key + "' />\n");
                out.println("<button type='submit'>Done</button>\n");
                out.println("</form>");
                out.println("</td>");
                out.println("</tr>");
            }
        }
    %>
</table>

</body>
</html>
