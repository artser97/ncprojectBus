package com.artser97.beans;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ControllerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ScheduleDAO scheduleDAO;

    public void init() {
        String jdbcURL = "jdbc:mysql://localhost:3306/ncprojectbus";
        String jdbcUsername = "root";
        String jdbcPassword = "Artser97";

        scheduleDAO = new ScheduleDAO(jdbcURL, jdbcUsername, jdbcPassword);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case "/new":
                    showNewForm(request, response);
                    break;
                case "/insert":
                    insertSchedule(request, response);
                    break;
                case "/delete":
                    deleteSchedule(request, response);
                    break;
                case "/edit":
                    showEditForm(request, response);
                    break;
                case "/update":
                    updateSchedule(request, response);
                    break;
                default:
                    listSchedule(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listSchedule(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Schedule> listSchedule = scheduleDAO.listAllSchedule();
        request.setAttribute("listSchedule", listSchedule);
        RequestDispatcher dispatcher = request.getRequestDispatcher("ScheduleList.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("ScheduleForm.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Schedule existingSchedule = scheduleDAO.getSchedule(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("ScheduleForm.jsp");
        request.setAttribute("schedule", existingSchedule);
        dispatcher.forward(request, response);

    }

    private void insertSchedule(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int busid = Integer.parseInt(request.getParameter("busid"));
        int busroute = Integer.parseInt(request.getParameter("busroute"));
        int busoperator = Integer.parseInt(request.getParameter("busoperator"));
        int busmodel = Integer.parseInt(request.getParameter("busmodel"));
        int tickets_av = Integer.parseInt(request.getParameter("tickets_av"));

        Schedule newSchedule = new Schedule(busid, busroute, busoperator,busmodel,tickets_av);
        scheduleDAO.insertSchedule(newSchedule);
        response.sendRedirect("listSchedule");
    }

    private void updateSchedule(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException  {
        int busid = Integer.parseInt(request.getParameter("busid"));
        int busroute = Integer.parseInt(request.getParameter("busroute"));
        int busoperator = Integer.parseInt(request.getParameter("busoperator"));
        int busmodel = Integer.parseInt(request.getParameter("busmodel"));
        int tickets_av = Integer.parseInt(request.getParameter("tickets_av"));

        Schedule newSchedule = new Schedule(busid, busroute, busoperator,busmodel,tickets_av);
        scheduleDAO.updateSchedule(newSchedule);
        response.sendRedirect("listSchedule");
    }

    private void deleteSchedule(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int busid = Integer.parseInt(request.getParameter("id"));

        Schedule schedule = new Schedule(busid);
        scheduleDAO.deleteSchedule(schedule);
        response.sendRedirect("listSchedule");

    }
}
