package com.artser97.beans;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ScheduleDAO {

    private String jdbcURL;
    private String jdbcUsername;
    private String jdbcPassword;
    private Connection jdbcConnection;

    public ScheduleDAO(String jdbcURL, String jdbcUsername, String jdbcPassword) {
        this.jdbcURL = jdbcURL;
        this.jdbcUsername = jdbcUsername;
        this.jdbcPassword = jdbcPassword;
    }

    protected void connect() throws SQLException {
        if (jdbcConnection == null || jdbcConnection.isClosed()) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                throw new SQLException(e);
            }
            jdbcConnection = DriverManager.getConnection(
                    jdbcURL, jdbcUsername, jdbcPassword);
        }
    }

    protected void disconnect() throws SQLException {
        if (jdbcConnection != null && !jdbcConnection.isClosed()) {
            jdbcConnection.close();
        }
    }

    public boolean insertSchedule(Schedule schedule) throws SQLException {
        String sql = "INSERT INTO bus_numbers (id, route_id, operator_id, vehicle_id,tickets_av) VALUES (?, ?, ?, ?, ?)";
        connect();

        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        statement.setInt(1, schedule.getBusid());
        statement.setInt(2, schedule.getBusroute());
        statement.setInt(3, schedule.getBusoperator());
        statement.setInt(4, schedule.getBusmodel());
        statement.setInt(5,schedule.getTickets_av());

        boolean rowInserted = statement.executeUpdate() > 0;
        statement.close();
        disconnect();
        return rowInserted;
    }

    public List<Schedule> listAllSchedule() throws SQLException {
        List<Schedule> listSchedule = new ArrayList<>();

        String sql = "SELECT bus_numbers.id,route_id,operator_id,vehicle_id,tickets_av,name FROM ncprojectbus.bus_numbers join ncprojectbus.bus_routes on bus_numbers.route_id = bus_routes.id join ncprojectbus.cities on bus_routes.dest = cities.id";

        connect();

        Statement statement = jdbcConnection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);

        while (resultSet.next()) {
            int busid = resultSet.getInt("id");
            int busroute = resultSet.getInt("route_id");
            int busoperator = resultSet.getInt("operator_id");
            int busmodel = resultSet.getInt("vehicle_id");
            int tickets_av = resultSet.getInt("tickets_av");
            String dest = resultSet.getString("name");
            Schedule schedule = new Schedule(busid, busroute, busoperator, busmodel, tickets_av, dest);
            listSchedule.add(schedule);
        }

        resultSet.close();
        statement.close();

        disconnect();

        return listSchedule;
    }

    public boolean deleteSchedule(Schedule schedule) throws SQLException {
        String sql = "DELETE FROM bus_numbers where id = ?";

        connect();

        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        statement.setInt(1, schedule.getBusid());

        boolean rowDeleted = statement.executeUpdate() > 0;
        statement.close();
        disconnect();
        return rowDeleted;
    }

    public boolean updateSchedule(Schedule schedule) throws SQLException {
        String sql = "UPDATE bus_numbers SET route_id = ?, operator_id = ?, vehicle_id = ?, tickets_av = ?";
        sql += " WHERE id = ?";
        connect();

        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        statement.setInt(1, schedule.getBusid());
        statement.setInt(2, schedule.getBusroute());
        statement.setInt(3, schedule.getBusoperator());
        statement.setInt(4, schedule.getBusmodel());
        statement.setInt(5,schedule.getTickets_av());


        boolean rowUpdated = statement.executeUpdate() > 0;
        statement.close();
        disconnect();
        return rowUpdated;
    }

    public Schedule getSchedule(int id) throws SQLException {
        Schedule schedule = null;
        String sql = "SELECT * FROM bus_numbers WHERE id = ?";

        connect();

        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        statement.setInt(1, id);

        ResultSet resultSet = statement.executeQuery();

        if (resultSet.next()) {
            int busid = resultSet.getInt("id");
            int busroute = resultSet.getInt("route_id");
            int busoperator = resultSet.getInt("operator_id");
            int busmodel = resultSet.getInt("vehicle_id");
            int tickets_av = resultSet.getInt("tickets_av");

            schedule = new Schedule(busid, busroute, busoperator, busmodel, tickets_av);
        }

        resultSet.close();
        statement.close();

        return schedule;
    }

}