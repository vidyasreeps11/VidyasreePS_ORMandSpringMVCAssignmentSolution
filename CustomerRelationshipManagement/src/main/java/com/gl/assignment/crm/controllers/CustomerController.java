package com.gl.assignment.crm.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gl.assignment.crm.dao.CustomerDAO;
import com.gl.assignment.crm.entity.Customer;
import com.gl.assignment.crm.service.CustomerService;


@Controller
public class CustomerController {
	
	@Autowired
	private CustomerService customerService;
	
	@RequestMapping("/")
	public String HomePage(Model theModel)
	{
		List<Customer> theCustomers=customerService.getCustomers();
		
		theModel.addAttribute("customers", theCustomers);
		
		return "list-customers";
	}
	
	@RequestMapping("/addCustomer")
	public String addCustomer(Model theModel)
	{
		
		Customer theCustomer=new Customer();
		
		theModel.addAttribute("customer", theCustomer);
		
		return "add-customer";
	}
	
	@RequestMapping("/list")
	public String listCustomers(Model theModel)
	{
		List<Customer> theCustomers=customerService.getCustomers();
		theModel.addAttribute("customers", theCustomers);
		
		return "list-customers";
	}

	@RequestMapping("/saveCustomer")
	public String customerConfirmation(@ModelAttribute("customer") Customer theCustomer)
	{
		customerService.saveCustomer(theCustomer);
		return "redirect:/list";
	}
	
	@RequestMapping("/updateCustomer")
	public String updateCustomer(@RequestParam("customerId") int theId, Model theModel)
	{
		Customer theCustomer=customerService.getCustomer(theId);
		theModel.addAttribute("customer",theCustomer);
		
		return "add-customer";
	}
	
	@RequestMapping("/deleteCustomer")
	public String deleteCustomer(@RequestParam("customerId") int theId)
	{
		customerService.deleteCustomer(theId);
		return "redirect:/list";
	}
}
