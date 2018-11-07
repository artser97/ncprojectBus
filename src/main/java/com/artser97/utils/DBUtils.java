package com.artser97.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.artser97.beans.Schedule;


public class DBUtils {




    public static List<Schedule> querySchedule(Connection conn) throws SQLException {
        String sql = "Select a.id, a.route_id, a.operator_id, a.vehicle_id, a.tickets_av from bus_numbers a ";

        PreparedStatement pstm = conn.prepareStatement(sql);

        ResultSet rs = pstm.executeQuery();
        List<Schedule> list = new ArrayList<Schedule>();
        while (rs.next()) {
            int busid = rs.getInt("id");
            int busroute = rs.getInt("route_id");
            int busoperator = rs.getInt("operator_id");
            int busmodel = rs.getInt("vehicle_id");
            int tickets_av = rs.getInt("tickets_av");
            Schedule schedule = new Schedule();
            schedule.setBusid(busid);
            schedule.setBusroute(busroute);
            schedule.setBusoperator(busoperator);
            schedule.setBusmodel(busmodel);
            schedule.setTickets_av(tickets_av);
            list.add(schedule);
        }
        return list;
    }

    public static Schedule findSchedule(Connection conn, int busid) throws SQLException {
        String sql = "Select a.id, a.route_id, a.operator_id, a.vehicle_id, a.tickets.av  from bus_numbers a where a.id=?";

        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, busid);

        ResultSet rs = pstm.executeQuery();

        while (rs.next()) {
            int busroute = rs.getInt("route_id");
            int busoperator = rs.getInt("operator_id");
            int busmodel = rs.getInt("vehicle_id");
            int tickets_av = rs.getInt("tickets_av");
            Schedule schedule = new Schedule(busid, busroute, busoperator, busmodel,tickets_av );
            return schedule;
        }
        return null;
    }

    public static void updateSchedule(Connection conn, Schedule schedule) throws SQLException {
        String sql = "Update bus_numbers set route_id =?, operator_id=?, vehicle_id=?, tickets_av=? where id=? ";

        PreparedStatement pstm = conn.prepareStatement(sql);

        pstm.setInt(1, schedule.getBusid());
        pstm.setInt(2, schedule.getBusroute());
        pstm.setInt(3, schedule.getBusoperator());
        pstm.setInt(4, schedule.getBusmodel());
        pstm.setInt(5, schedule.getTickets_av());
        pstm.executeUpdate();
    }

    public static void insertSchedule(Connection conn, Schedule schedule) throws SQLException {
        String sql = "Insert into bus_numbers(id, route_id, operator_id, vehicle_id, tickets_av values (?,?,?,?,?)";

        PreparedStatement pstm = conn.prepareStatement(sql);

        pstm.setInt(1, schedule.getBusid());
        pstm.setInt(2, schedule.getBusroute());
        pstm.setInt(3, schedule.getBusoperator());
        pstm.setInt(4, schedule.getBusmodel());
        pstm.setInt(5, schedule.getTickets_av());

        pstm.executeUpdate();
    }

    public static void deleteSchedule(Connection conn, int busid) throws SQLException {
        String sql = "Delete From bus_numbers where id= ?";

        PreparedStatement pstm = conn.prepareStatement(sql);

        pstm.setInt(1, busid);

        pstm.executeUpdate();
    }



}
