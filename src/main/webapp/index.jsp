<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="web.ResultBean" %>
<%@ page import="web.Point" %>
<%@ page import="com.example.web2.AreaCheckServlet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="ru">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>WEB 2</title>
  <style>
    body, html {
      margin: 0;
      padding: 0;
      height: 100%;
      display: flex;
      flex-direction: column;
    }

    .main-container {
      display: flex;
      flex-direction: column;
      justify-content: space-between; /* Распределяет элементы */
      height: 100%; /* Высота окна */
    }

    .tableResult {
      margin-top: auto; /* Прижимает таблицу к низу */
      text-align: center;
      padding-bottom: 10px; /* Отступ снизу */
    }

    #resultTable {
      margin: auto;
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
    header {
      font-family: cursive;
      color: #333;
      font-size: 24px;
      text-align: center;
      background-color: #f0f0f0;
      padding: 80px;
      margin-bottom: 5px;
      height: 150px;
    }

    table {
      margin: auto;
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

    img {
      float: left;
      margin-right: 10px;
    }



    th {
      background-color: #ccc;
      color: white;
    }

    tr:hover {
      background-color: #f2f2f2;
    }
    a {
      color: inherit; /* Цвет текста наследуется от родительского элемента */
      text-decoration: none; /* Убирает подчёркивание */
      cursor: text; /* Устанавливает курсор текста, вместо стандартного указателя */
    }
    table input {
      margin: 2%;
    }

    .grid-container {
      display: grid;
      grid-template-columns: repeat(5, auto);
      justify-content: center;
      align-items: center;
      gap: 20px;
    }

    .grid-item {
      display: flex;
      flex-direction: column;
      align-items: center;
    }
    .grid-itemR {
      display: flex;
      flex-direction: column;
      align-items: center;
    }
    .grid-containerR {
      display: grid;
      grid-template-columns: repeat(5, auto);
      justify-content: center;
      align-items: center;
      gap: 20px;
    }
    .back-button {
      position: relative;
      left: 40%;
      bottom: 25%;
      display: block;
      width: 150px;
      height: 50px;
      border: none;
      border-radius: 5px;
      background-color: black;
      color: white;
      cursor: pointer;
    }
    .link-button{
      position: relative;
      left: 40%;
      bottom: 25%;
      display: block;
      width: 150px;
      height: 50px;
      border: none;
      border-radius: 5px;
      background-color: black;
      color: white;
      cursor: pointer;
    }
    .link-button:hover {
      display: block;
      background-color: green;
      box-shadow: 0 0 10px black;
    }

    .back-button:hover {
      display: block;
      background-color: green;
      box-shadow: 0 0 10px black;
    }

    .error-message {
      margin-top: 5px;
      color: red;
      text-align: center;
    }
    .graph {
      flex: 1;
    }
    .right {
      flex: 1;
      background-color: #d0d0d0;
    }
    .container {
      display: flex;
    }
  </style>
</head>
<body>
<%--<img src="logo_osnovnoy_angliyskiy_chernyy.png" height="100" width="270">--%>
<header>
  <p>фио: Замахин Степан Андреевич</p>
  <p>Группа: Р3225</p>
  <p>Номер варианта: 395243</p>
</header>
<script src="graphik.js"></script>
<script src="scripts.js"></script>
<div class="container">
  <div class="graphik">
    <canvas id="canvas1" style="z-index: 0" width="400" height="400"></canvas>
    <div id="canvasR" class="error-message"></div>
  </div>
  <div class="right">
    <table>
      <thead>
      <tr>
        <th>Параметр</th>
        <th>Значение</th>
      </tr>
      </thead>
      <tbody>
      <tr>
        <td>X-координата:</td>
        <td>

          <div class="grid-container">
            <div class="grid-item">
              <input type="checkbox" class="x-checkbox" id="grid-checkbox1" name="x" value="-5">
              <label for="grid-checkbox1">-5</label>
            </div>
            <div class="grid-item">
              <input type="checkbox" class="x-checkbox" id="grid-checkbox2" name="x" value="-4">
              <label for="grid-checkbox2">-4</label>
            </div>
            <div class="grid-item">
              <input type="checkbox" class="x-checkbox" id="grid-checkbox3" name="x" value="-3">
              <label for="grid-checkbox3">-3</label>
            </div>
            <div class="grid-item">
              <input type="checkbox" class="x-checkbox" id="grid-checkbox4" name="x" value="-2">
              <label for="grid-checkbox4">-2</label>
            </div>
            <div class="grid-item">
              <input type="checkbox" class="x-checkbox" id="grid-checkbox5" name="x" value="-1">
              <label for="grid-checkbox5">-1</label>
            </div>
            <div class="grid-item">
              <input type="checkbox" class="x-checkbox" id="grid-checkbox6" name="x" value="0">
              <label for="grid-checkbox6">0</label>
            </div>
            <div class="grid-item">
              <input type="checkbox" class="x-checkbox" id="grid-checkbox7" name="x" value="1">
              <label for="grid-checkbox7">1</label>
            </div>
            <div class="grid-item">
              <input type="checkbox" class="x-checkbox" id="grid-checkbox8" name="x" value="2">
              <label for="grid-checkbox8">2</label>
            </div>
            <div class="grid-item">
              <input type="checkbox" class="x-checkbox" id="grid-checkbox9" name="x" value="3">
              <label for="grid-checkbox9">3</label>
            </div>
          </div>
          <div id="error-message-x" class="error-message"></div>
        </td>
      </tr>
      <tr>
        <td>Y-координата (-3 до 3):</td>
        <td>
          <input type="text" id="coordY" name="y">
          <div id="error-message-y" class="error-message"></div>
        </td>
      </tr>
      <tr>
        <td>Радиус R(1 до 5):</td>
        <td>
          <div class="grid-containerR">
            <div class="grid-itemR">
              <input type="checkbox" class="r-checkbox" id="grid-checkboxR1" name="r" value="1">
              <label for="grid-checkboxR1">1</label>
            </div>
            <div class="grid-itemR">
              <input type="checkbox" class="r-checkbox" id="grid-checkboxR2" name="r" value="2">
              <label for="grid-checkboxR2">2</label>
            </div>
            <div class="grid-itemR">
              <input type="checkbox" class="r-checkbox" id="grid-checkboxR3" name="r" value="3">
              <label for="grid-checkboxR3">3</label>
            </div>
            <div class="grid-itemR">
              <input type="checkbox" class="r-checkbox" id="grid-checkboxR4" name="r" value="4">
              <label for="grid-checkboxR4">4</label>
            </div>
            <div class="grid-itemR">
              <input type="checkbox" class="r-checkbox" id="grid-checkboxR5" name="r" value="5">
              <label for="grid-checkboxR5">5</label>
            </div>
          </div>
          <div id="error-message-r" class="error-message"></div>
        </td>
      </tr>
      <tr>
        <td colspan="2">
          <button class="back-button" id="backButton">Отправить</button>
        </td>
      </tr>
      <tr>
        <td colspan="2">
          <button class="link-button" onclick="location.href='result.jsp'">На страницу с результатами</button>
        </td>
      </tr>
      </tbody>
    </table>
  </div>
</div>
<script>
  points = [];
  function checkArea(x, y, r) {
    // Проверка для прямоугольника
    let rect = x <= 0 && y >= 0 && x >= -r && y <= r;

    // Проверка для круга
    let circle = x >= 0 && y >= 0 && (x * x + y * y <= r * r);

    // Проверка для треугольника
    let triangle = x <= 0 && y <= 0 && y >= -x - r / 2 && x >= -r / 2 && y >= -r / 2;

    // Возвращаем true, если хотя бы одно условие выполнено
    return rect || circle || triangle;
  }
  const canvas = document.getElementById('canvas1');
  var r_checkbox1 = document.getElementById("grid-checkboxR1");
  var r_checkbox2 = document.getElementById("grid-checkboxR2");
  var r_checkbox3 = document.getElementById("grid-checkboxR3");
  var r_checkbox4 = document.getElementById("grid-checkboxR4");
  var r_checkbox5 = document.getElementById("grid-checkboxR5");
  r_checkbox1.addEventListener("click", function (event){
    selectedR = 1;
    graphikInit(selectedR);
    newListOfPoints = [];
    for (let i = 0; i < points.length; i++) {
      thisX = points[i][0];
      thisY  =points[i][1];
      statuss = checkArea(thisX, thisY, selectedR);
      newListOfPoints.push([thisX, thisY, selectedR, statuss])
    }
    redrawPoints(newListOfPoints, selectedR);
  });
  r_checkbox2.addEventListener("click", function (event){
    selectedR = 2;
    graphikInit(selectedR);
    newListOfPoints = [];
    for (let i = 0; i < points.length; i++) {
      thisX = points[i][0];
      thisY  =points[i][1];
      statuss = checkArea(thisX, thisY, selectedR);
      newListOfPoints.push([thisX, thisY, selectedR, statuss])
    }
    redrawPoints(newListOfPoints, selectedR);
  });
  r_checkbox3.addEventListener("click", function (event){
    selectedR = 3;
    graphikInit(selectedR);
    newListOfPoints = [];
    for (let i = 0; i < points.length; i++) {
      thisX = points[i][0];
      thisY  =points[i][1];
      statuss = checkArea(thisX, thisY, selectedR);
      newListOfPoints.push([thisX, thisY, selectedR, statuss])
    }
    redrawPoints(newListOfPoints, selectedR);
  });
  r_checkbox4.addEventListener("click", function (event){
    selectedR = 4;
    graphikInit(selectedR);
    newListOfPoints = [];
    for (let i = 0; i < points.length; i++) {
      thisX = points[i][0];
      thisY  =points[i][1];
      statuss = checkArea(thisX, thisY, selectedR);
      newListOfPoints.push([thisX, thisY, selectedR, statuss])
    }
    redrawPoints(newListOfPoints, selectedR);
  });
  r_checkbox5.addEventListener("click", function (event){
    selectedR = 5;
    graphikInit(selectedR);
    newListOfPoints = [];
    for (let i = 0; i < points.length; i++) {
      thisX = points[i][0];
      thisY  =points[i][1];
      statuss = checkArea(thisX, thisY, selectedR);
      newListOfPoints.push([thisX, thisY, selectedR, statuss])
    }
    redrawPoints(newListOfPoints, selectedR);
  });
  graphikInit();
  canvas.addEventListener("click", function (event) {
    var checkBoxesR = document.getElementsByName("r");
    var rError = document.getElementById("canvasR");
    rError.innerHTML = "";
    var selectedR = null;
    for (var i = 0; i < checkBoxesR.length; i++) {
      if (checkBoxesR[i].checked) {
        selectedR = checkBoxesR[i];
        r = selectedR.value;
        break;
      }
    }
    if (selectedR === null) {
      rError.innerHTML = "чтобы отправить данные, нужно выбрать R";
      flag = false;
    }
    else{
      byClick(event, canvas, 160);
    }
  });
</script>
<div class="tableResult">
  <table id="resultTable">
    <thead>
    <tr>
      <th>X</th>
      <th>Y</th>
      <th>R</th>
      <th>Попадание в область</th>
      <th>Время выполнения, мс</th>
      <th>Дата и время</th>
    </tr>
    </thead>
    <tbody style="text-align: center;">
    <%
      ResultBean results = (ResultBean) session.getAttribute("resultBean");
      if (results != null) {
        ArrayList<Point> list = results.getList();
        Collections.reverse(list);
        double currentR = list.get(0).getR();
        for (Point result : list) {
    %>
    <tr>
      <td><%= result.getX() %></td>
      <td><%= result.getY() %></td>
      <td><%= result.getR() %></td>
      <td><%= result.getStatus() ? "Попадание" : "Промах" %></td>
      <td><%= String.format(Locale.ENGLISH, "%.4f", result.getExecutionTime()) %></td>
      <td><%= result.getDatetime() %></td>
    </tr>
    <script style="z-index: 2">
      points.push(["<%= result.getX() %>", "<%= result.getY() %>", "<%= currentR %>", <%= result.getStatus() %>])
      drawDot("<%= result.getX() %>", "<%= result.getY() %>", "<%= currentR %>", <%= result.getStatus() %>)</script>
    <%
        }
      }
    %>
    </tbody>
  </table>



</div>
</body>
<script>

  const checkboxInputs = document.getElementsByName("x");
  const checkboxInputsR = document.getElementsByName("r");

  function checkOnlyOne(checkbox) {
    checkboxInputs.forEach((item) => {
      if (item !== checkbox) item.checked = false;
    });
  }
  window.onload = function() {
    document.getElementById("coordY").value = null;
  };
  function checkOnlyOneR(checkboxR) {
    checkboxInputsR.forEach((item) => {
      if (item !== checkboxR) item.checked = false;
    });
  }

  checkboxInputs.forEach(function (checkbox) {
    checkbox.addEventListener("click", function () {
      checkOnlyOne(checkbox);
    });
  });
  checkboxInputsR.forEach(function (checkbox) {
    checkbox.addEventListener("click", function () {
      checkOnlyOneR(checkbox);
    });
  });


  document.getElementById("backButton").addEventListener("click", function () {
    var checkBoxes = document.getElementsByName("x");
    var checkBoxesR = document.getElementsByName("r");
    var coordY = document.getElementById("coordY");
    var xError = document.getElementById("error-message-x");
    var yError = document.getElementById("error-message-y");
    var rError = document.getElementById("error-message-r");
    var flag = true;

    // Очистка предыдущих ошибок
    xError.innerHTML = "";
    yError.innerHTML = "";
    rError.innerHTML = "";

    // Проверка X
    var selectedX = null;
    for (var i = 0; i < checkBoxes.length; i++) {
      if (checkBoxes[i].checked) {
        selectedX = checkBoxes[i];
        break;
      }
    }
    if (selectedX === null) {
      xError.innerHTML = "Значение X не выбрано";
      flag = false;
    }

    // Проверка R
    var selectedR = null;
    for (var i = 0; i < checkBoxesR.length; i++) {
      if (checkBoxesR[i].checked) {
        selectedR = checkBoxesR[i];
        break;
      }
    }
    if (selectedR === null) {
      rError.innerHTML = "Значение R не выбрано";
      flag = false;
    }

    // Проверка Y
    if (coordY.value === "" || isNaN(coordY.value) || coordY.value < -3 || coordY.value > 3) {
      yError.innerHTML = "Введите корректное значение Y";
      flag = false;
    }

    // Если все проверки прошли
    if (flag) {
      submitForm(selectedX, coordY, selectedR);
    }
  });

</script>
</html>
