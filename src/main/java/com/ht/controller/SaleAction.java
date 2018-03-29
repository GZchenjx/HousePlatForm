package com.ht.controller;

import com.ht.bean.Employee;
import com.ht.bean.Room;
import com.ht.bean.Sale;
import com.ht.common.ControllerResult;
import com.ht.price.AgencyPrice;
import com.ht.price.CustomerPrice;
import com.ht.price.EmployeePrice;
import com.ht.service.SaleService;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.interceptor.ServletRequestAware;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * 销售记录表
 * Created by ID.LQF on 2017/9/25.
 */
public class SaleAction extends ActionSupport implements ServletRequestAware {

    private ControllerResult result;
    private HttpServletRequest request;
    private SaleService saleService;
    private Sale sale;
    private Employee employee;
    private CustomerPrice customerPrice;
    private List<Sale> sales;
    private Room room;
    private Date sale_time;//销售时间
    private Double unit_price;//销售单价
    private Double discount;//销售折扣
    private Double total_cost;//销售总价


    public void setSale_time(Date sale_time) {
        this.sale_time = sale_time;
    }

    public void setUnit_price(Double unit_price) {
        this.unit_price = unit_price;
    }

    public void setDiscount(Double discount) {
        this.discount = discount;
    }

    public void setTotal_cost(Double total_cost) {
        this.total_cost = total_cost;
    }

    public CustomerPrice getCustomerPrice() {
        return customerPrice;
    }

    public void setCustomerPrice(CustomerPrice customerPrice) {
        this.customerPrice = customerPrice;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public ControllerResult getResult() {
        return result;
    }

    public void setResult(ControllerResult result) {
        this.result = result;
    }

    public Sale getSale() {
        return sale;
    }

    public void setSale(Sale sale) {
        this.sale = sale;
    }

    public void setSaleService(SaleService saleService) {
        this.saleService = saleService;
    }

    public List<Sale> getSales() {
        return sales;
    }

    public void setSales(List<Sale> sales) {
        this.sales = sales;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    //房屋销售图表查看
    public String saleChart(){
        HttpSession session = request.getSession();
        employee = (Employee)session.getAttribute("employee");
        sales = saleService.queryAllSale(employee.getId());
        return "saleChart";
    }

    //添加销售记录
    public String addSale(){
        HttpSession session = request.getSession();
        if(session.getAttribute("employee")!=null){
            Employee employee = (Employee)session.getAttribute("employee");
            EmployeePrice employeePrice = new EmployeePrice();
            employeePrice.setId(employee.getId());
            Sale salee = new Sale();
            salee.setUnit_price(unit_price);
            salee.setTotal_cost(total_cost);
            salee.setSale_time(sale_time);
            salee.setDiscount(discount);
            salee.setCreated_time(new Date());
            salee.setCustomer(customerPrice);
            salee.setRoom(room);
            salee.setAgencyPrice(employee.getAgencyPrice());
            salee.setEmployee(employeePrice);
            salee.setStatus(1);
            saleService.add(salee);
            result =ControllerResult.getSuccessResult("添加成功");
        }else {
            result =ControllerResult.getFailResult("添加失败");
        }

        return "addSale";
    }

    @Override
    public void setServletRequest(HttpServletRequest httpServletRequest) {
        this.request = httpServletRequest;
    }
}
