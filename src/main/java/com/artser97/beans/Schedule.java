package com.artser97.beans;

public class Schedule {

    private int busid;
    private int busroute;
    private int busoperator;
    private int busmodel;
    private int tickets_av;
    private String departure;
    private String arrival;

    public Schedule(){}

<<<<<<< HEAD
    public Schedule(int busid) {
        this.busid = busid;
    }

=======
>>>>>>> origin
    public Schedule(int busid,int busroute,int busoperator,int busmodel,int tickets_av){
        this.busid = busid;
        this.busroute = busroute;
        this.busoperator = busoperator;
        this.busmodel = busmodel;
        this.tickets_av = tickets_av;

    }

    public int getBusid(){
        return busid;
    }

    public void setBusid(int busid){
        this.busid = busid;
    }

    public int getBusroute(){
        return busroute;
    }

    public void setBusroute(int busroute){
        this.busroute = busroute;
    }

    public int getBusoperator(){
        return busoperator;
    }

    public void setBusoperator(int busoperator){
        this.busoperator =  busoperator;
    }

    public int getBusmodel(){
        return busmodel;
    }

    public void setBusmodel(int busmodel){
        this.busmodel = busmodel;
    }

    public int getTickets_av(){
        return tickets_av;
    }

    public void setTickets_av(int tickets_av){
        this.tickets_av = tickets_av;
    }

    public String getDeparture(){
        return departure;
    }

    public void setDeparture(String departure){
        this.departure = departure;
    }

    public String getArrival(){
        return arrival;
    }

    public void setArrival(String arrival){
        this.arrival = arrival;
    }



}
