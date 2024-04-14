package com.ctbc.eportal.model;

import org.springframework.data.jpa.repository.JpaRepository;

public interface DepartmentRepository extends JpaRepository<Department, Integer> {
	boolean existsByName(String name);
}