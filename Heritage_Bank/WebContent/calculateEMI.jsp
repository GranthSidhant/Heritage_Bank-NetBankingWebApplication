<%@ page language="java" contentType="text/plain; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String loanAmountStr = request.getParameter("loanAmount");
    String interestRateStr = request.getParameter("interestRate");
    String loanTenureStr = request.getParameter("loanTenure");

    if (loanAmountStr != null && interestRateStr != null && loanTenureStr != null) {
        double loanAmount = Double.parseDouble(loanAmountStr);
        double interestRate = Double.parseDouble(interestRateStr);
        double loanTenure = Double.parseDouble(loanTenureStr);

        double monthlyInterestRate = (interestRate / 12) / 100;
        double numberOfPayments = loanTenure * 12;

        double emi = (loanAmount * monthlyInterestRate * Math.pow(1 + monthlyInterestRate, numberOfPayments)) /
                    (Math.pow(1 + monthlyInterestRate, numberOfPayments) - 1);

        out.println("<strong>EMI:</strong> ₹" + String.format("%.2f", emi));
    } else {
        out.println("Invalid input. Please try again.");
    }
%>