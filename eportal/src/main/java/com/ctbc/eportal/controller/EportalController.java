package com.ctbc.eportal.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ctbc.eportal.model.Department;
import com.ctbc.eportal.model.DepartmentRepository;
import com.ctbc.eportal.model.Employee;
import com.ctbc.eportal.model.EmployeeRepository;

@Controller
public class EportalController {

	@Autowired
	private DepartmentRepository departmentRepository;
	@Autowired
	private EmployeeRepository employeeRepository;

	@RequestMapping(value = "/department")
	public String department() {
		return "addDepartment";
	}

	@PostMapping("/department/add")
	public String addDepartment(Department department, Model model) {
		if (departmentRepository.existsByName(department.getName())) {
			model.addAttribute("errorMessage", "部門名稱已經被新增");
			return "addDepartment";
		} else {
			departmentRepository.save(department);
			model.addAttribute("department", department);
			return "departmentDetails";
		}
	}

	@RequestMapping(value = "/employee")
	public String employee(Model model) {
		List<Department> departments = departmentRepository.findAll();
		model.addAttribute("departments", departments);
		return "addEmployee";
	}

	@PostMapping("/employee/add")
	public String addEmployee(Employee employee, Model model) {
		employeeRepository.save(employee);
		model.addAttribute("employees", employee);
		return "employeeDetails";
	}

	@RequestMapping(value = "/edit")
	public String edit(Model model) {
		Iterable<Employee> employees = employeeRepository.findAll();
		model.addAttribute("employees", employees);
		return "editEmployee";
	}

	@PostMapping("/edit/delete")
	public String deleteEmployee(@RequestParam("id") Integer id) {
		employeeRepository.deleteById(id);
		return "redirect:/edit";
	}

	@PostMapping("/edit/update")
	public String updateEmployee(@RequestParam("id") Integer id, Model model) {
		Employee employee = employeeRepository.findById(id).orElse(null);
		model.addAttribute("employee", employee);
		List<Department> departments = departmentRepository.findAll();
		model.addAttribute("departments", departments);
		return "updateEmployee";
	}

	@PostMapping("/edit/save")
	public String saveEmployee(@RequestParam("id") Integer id, @RequestParam("name") String name,
			@RequestParam("email") String email, @RequestParam("sex") Integer sex,
			@RequestParam("department") Integer departmentId) {
		Employee employee = employeeRepository.findById(id).orElse(null);
		if (employee != null) {
			employee.setName(name);
			employee.setEmail(email);
			employee.setSex(sex);
			Department department = departmentRepository.findById(departmentId).orElse(null);
			employee.setDepartment(department);
			employeeRepository.save(employee);
		}
		return "redirect:/edit";
	}
}
