package com.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sdo.SDOServiceWell;
import com.services.EquipmentService;
import com.utility.NewDatabase;
import com.utility.NewFile;
import com.utility.ParseSQLForXML;
import com.utility.XMLXStream;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(value = "/hello")
public class MainServlet extends HttpServlet {

	private static final String CON_STR = "jdbc:sqlite:test.db";

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		NewFile.createFile("test.db");

		NewDatabase.createDatabase(CON_STR);

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		request.getRequestDispatcher("/WEB-INF/main.jsp").include(request, response);
		out.close();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		final EquipmentService equipmentService = EquipmentService.getInstance(CON_STR);
		final SDOServiceWell serviceWell = com.sdo.SDOServiceWell.getInstance(CON_STR);

		if (request.getParameter("nameWell") != null && request.getParameter("countEquipment") != null
				&& !request.getParameter("countEquipment").equals("") && !request.getParameter("nameWell").equals("")) {

			String nameWell = request.getParameter("nameWell");
			int countEquipment = Integer.valueOf(request.getParameter("countEquipment"));

			createNEquipment(nameWell, countEquipment, equipmentService);

			request.setAttribute("text", "Создано " + countEquipment + " оборудования на скважине " + nameWell);
			System.out.println("получили " + nameWell + " " + countEquipment);

		} else if (request.getParameter("allWell") != null && !request.getParameter("allWell").equals("")) {

			String list=serviceWell.getAll();
			System.out.println("Получили ВСЁ");

			request.setAttribute("text", list);

		} else if (request.getParameter("namesWell") != null && !request.getParameter("namesWell").equals("")) {
			String namesWell = request.getParameter("namesWell");
			String names=outputAllInformationAboutWell(namesWell, equipmentService);

			request.setAttribute("text", names);

		} else if (request.getParameter("oldName") != null && request.getParameter("newName") != null && !request.getParameter("oldName").equals("") && !request.getParameter("newName").equals("")) {

			String oldName=request.getParameter("oldName");
			String newName=request.getParameter("newName"); 
			updateWell(oldName,newName, serviceWell);

			request.setAttribute("text", "Название скважины "+ oldName+" было заменено на "+newName);

		} else if (request.getParameter("nameFile") != null && !request.getParameter("nameFile").equals("")) {
			String xmlString=exportXMLFile(request.getParameter("nameFile"));

			request.setAttribute("text", "Был создан файл "+request.getParameter("nameFile")+".xml\n "+xmlString);
		}
		request.getRequestDispatcher("/WEB-INF/main.jsp").forward(request, response);
	}

	private static void createNEquipment(String wellName, int countEquipment, EquipmentService equipmentService) {

		equipmentService.createEquipment(wellName, countEquipment);
	}

	private static String outputAllInformationAboutWell(String strName, EquipmentService equipmentService) {

		String[] arrName = strName.split(",");
		String all="";
		for (String wellName : arrName) {
			if (wellName != null || !wellName.equals(""))
				all+=equipmentService.countEquipment(wellName)+"\n";
			else
				return ("Имя скважины не может быть пустым");
		}
		return all;

	} // Вывод в xml

	private static String exportXMLFile(String pathName) {
		pathName += ".xml";
	  ParseSQLForXML.inputInfoInFile(pathName, CON_STR);
	  return ParseSQLForXML.readStream(pathName);
	}

	private static void updateWell(String oldName, String newName, SDOServiceWell serviceWell) {
		serviceWell.renameObject(oldName, newName);
	}
}
