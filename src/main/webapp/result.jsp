<%@ page import="web.ResultBean" %>
<%@ page import="web.Point" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>
  img{
    margin-top: 10px;
  }
  body{
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
  }
  table {
    border-collapse: collapse;
    background-color: #fff;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
  }
  th, td {
    width: 1%;
    border: 1px solid #ccc;
    padding: 10px;
    text-align: center;
  }
  th {
    background-color: #ccc;
    color: white;
  }

  tr:hover {
    background-color: #f2f2f2;
  }
  img {
  float: left;
  margin-right: 10px;
  }
  header {
    font-family: cursive;
    color: #333;
    font-size: 24px;
    text-align: left;
    background-color: #f0f0f0;
    padding: 80px;
    margin-bottom: 5px;
    height: 30px;
  }
  .link-button{
    position: relative;
    left: 25%;
    bottom: 30%;
    display: block;
    width: 150px;
    height: 50px;
    border: none;
    border-radius: 5px;
    background-color: black;
    color: white;
    cursor: pointer;
    margin-top: 10px;
  }
  .link-button:hover {
    display: block;
    background-color: green;
    box-shadow: 0 0 10px black;
  }
</style>


<!DOCTYPE html>
<html lang="ru">
<head>
  <meta http-equiv="Content-Type" content="text/html" charset="utf-8">
  <title>result</title>
</head>
<body>
<script src="scripts.js"></script>

<div class="main">

  <div class="records center-wrapper">
    <div class="tableResult">
      <table id="resultTable">
        <thead>
        <tr>
          <th>X</th>
          <th>Y</th>
          <th>R</th>
          <th>Попадание в область</th>
        </tr>
        </thead>
        <tbody style="text-align: center;">

      <%
        ResultBean results = (ResultBean) session.getAttribute("resultBean");
        if (results != null) {
          ArrayList<Point> list = results.getList();
          Collections.reverse(list);
          Point lastPoint = list.get(0);
      %>
      <tr>
        <td><%= lastPoint.getX() %></td>
        <td><%= lastPoint.getY() %></td>
        <td><%= lastPoint.getR() %></td>
        <td><%= lastPoint.getStatus() ? "Попадание" : "Промах" %></td>
      </tr>
      <%
        }
      %>
    </tbody>
    </table>
      <button id="but" class="link-button" onclick="location.href='index.jsp'">На предыдущую страницу</button>
    </div>
  </div>
</div>
</body>
</html>