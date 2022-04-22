<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
<style>
.model {
	border-radius: 50px;
	size: 50;
	weidth: 100px;
	height: 500px;
}

.output {
	border-radius: 50px;
}

.button {
	background-color: #ccc;
	margin: 5px;
}

.nav {
	display: flex;
	flex-direction: row;
	justify-content: center;
}

#container {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	height: 100vh;
	width: 100%;
}

.button {
	background-color: rgba(220, 220, 235, 0.5);
	text-align: center;
	cursor: pointer;
	border-radius: 10px;
	transition: all ease-in-out 0.5s;
	margin-top: 1rem;
}

.button:hover {
	background-color: rgba(220, 220, 235, 0.7);
	transition: all ease 0.3s;
}

.button {
	padding: 0.6rem;
}

#zatemnenie {
	background: rgba(102, 102, 102, 0.5);
	width: 100%;
	height: 100%;
	position: absolute;
	top: 0;
	left: 0;
	display: none;
}

#okno {
	top: 10%;
	left: 0;
	right: 0;
	font-size: 14px;
	margin: auto;
	width: 40%;
	min-width: 300px;
	max-width: 700px;
	position: absolute;
	padding: 15px 20px;
	border: 1px solid #666;
	background-color: #fefefe;
	z-index: 1000;
	border-radius: 10px;
	font: 14px/18px 'Tahoma', Arial, sans-serif;
	box-shadow: 0 0px 14px rgba(0, 0, 0, 0.4);
}

#zatemnenie:target {
	display: block;
}

#zatemnenie1:target {
	display: block;
}

#zatemnenie1 {
	background: rgba(102, 102, 102, 0.5);
	width: 100%;
	height: 100%;
	position: absolute;
	top: 0;
	left: 0;
	display: none;
}

#zatemnenie2:target {
	display: block;
}

#zatemnenie2 {
	background: rgba(102, 102, 102, 0.5);
	width: 100%;
	height: 100%;
	position: absolute;
	top: 0;
	left: 0;
	display: none;
}

#zatemnenie3:target {
	display: block;
}

#zatemnenie3 {
	background: rgba(102, 102, 102, 0.5);
	width: 100%;
	height: 100%;
	position: absolute;
	top: 0;
	left: 0;
	display: none;
}

#zatemnenie4:target {
	display: block;
}

#zatemnenie4 {
	background: rgba(102, 102, 102, 0.5);
	width: 100%;
	height: 100%;
	position: absolute;
	top: 0;
	left: 0;
	display: none;
}

.close {
	top: 10px;
	right: 10px;
	width: 32px;
	height: 32px;
	position: absolute;
	border: none;
	border-radius: 50%;
	background-color: rgba(0, 130, 230, 0.9);
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0
		rgba(0, 0, 0, 0.12);
	cursor: pointer;
	outline: none;
}

.close:before {
	color: rgba(255, 255, 255, 0.9);
	content: "X";
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
	font-weight: normal;
	text-decoration: none;
	text-shadow: 0 -1px rgba(0, 0, 0, 0.9);
}

.close:hover {
	background-color: rgba(180, 20, 14, 0.8);
}

* {
	box-sizing: border-box;
	color: #454845;
	font-weight: 500;
	font-family: 'Montserrat', 'Helvetica', sans-serif;
	font-size: 1.2rem;
	padding: 0;
	margin: 0;
	text-align: center;
}

.notice-success {
	box-sizing: border -box;
	background: linear-gradient(253deg, #b3289c, #65b1d4);
}

.inner {
	margin: 0 auto;
	width: 100px;
}
</style>
</head>



<body class="notice-success">
	 
	<div id="zatemnenie" class="modal">
		      
		<form class="inner" id="okno" method="post" action="hello">
			<br>  
			<p>
				<b>Введите имя скважины:</b><br><br>   <input type="text"
					name="nameWell">
			</p>
			<br>  
			<p>
				<b>Введите количество оборудования:</b><br><br>   <input
					type="number" name="countEquipment">
			</p>
			<br>    <input class="button" type="submit" value="Создать" />      
			<button onclick="location.hash ='close'" class="close"
			></button>
			      
		</form>
		    
	</div>



	<div id="zatemnenie2" class="modal">
		      
		<form class="inner" id="okno" method="post" action="hello">
			<br>  
			<p>
				<b>Введите имя скважин через запятую:</b> <br> <br>   <input
					type="text" name="namesWell">
			</p>
			<br>    <input class="button" type="submit"
				value="Вывести информацию об оборудовании" />      
		<button onclick="location.hash ='close'" class="close"
			></button>
			      
		</form>
		    
	</div>
	<div id="zatemnenie3" class="modal">
		      
		<form class="inner" id="okno" method="post" action="hello">
			<br>  
			<p>
				<b>Введите старое имя скважины:</b> <br> <br>   <input
					type="text" name="oldName">
			</p>
			<br>
			<p>
				<b>Введите новое имя:</b> <br> <br>   <input type="text"
					name="newName">
			</p>
			<br>   
			<central> <input class="button" type="submit" value="Изменить имя" />
			     </central>
			<button onclick="location.hash ='close'" class="close"
				title="Закрыть окно"></button>
			      
		</form>
		    
	</div>

	<div id="zatemnenie4" class="modal">
		<form class="inner" id="okno" method="post" action="hello">
			<br>  
			<p>
				<b>Введите название файла:</b><br><br>  <input type="text"
					name="nameFile">
			</p>
			<br>    <input class="button" type="submit" value="Создать файл" />      
			<button onclick="location.hash ='close'" class="close"
				title="Закрыть окно"></button>
			   
		</form>
		  
	</div>
	<nav>
		<button class="button" name="createN"
			onclick="location.hash ='zatemnenie' ">Создание N кол-ва
			оборудования на скважине.</button>
		<br>
		<button class="button" name="outputInfo"
			onclick="location.hash ='zatemnenie2'">Вывод общей
			информации об оборудовании на скважинах.</button>
		<br>
		<button class="button" name="XML"
			onclick="location.hash ='zatemnenie4'">Экспорт всех данных в
			xml файл.</button>
		<br>
		<button class="button" name="rename"
			onclick="location.hash ='zatemnenie3'">Изменить имя
			скважины(sdo)</button>
		<br>
		<form method="post" action="hello?allWell=true">
			<input class="button" name="getAll" type="submit"
				value="Вывести все названия скважин(sdo)" />
		</form>
	</nav>
	<textarea cols="50" rows="14" class="output" name="result">${text}</textarea>
</body>
</html>