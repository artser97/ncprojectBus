package com.artser97.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.artser97.beans.Schedule;
import com.artser97.utils.DBUtils;
import com.artser97.utils.MyUtils;


@WebServlet(urlPatterns = { "/scheduleList" })
public class ScheduleListServlet extends HttpServlet{

    private static final long serialVersionUID = 1L;

    public ScheduleListServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection conn = MyUtils.getStoredConnection(request);

        String errorString = null;
        List<Schedule> list = null;
        try {
            list = DBUtils.querySchedule(conn);
        } catch (SQLException e) {
            e.printStackTrace();
            errorString = e.getMessage();
        }
        // Сохранить информацию в request attribute перед тем как forward к views.
        request.setAttribute("errorString", errorString);
        request.setAttribute("scheduleList", list);

        // Forward к /WEB-INF/views/scheduleListView.jsp
        RequestDispatcher dispatcher = request
                .getRequestDispatcher("/WEB-INF/views/_footer.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
