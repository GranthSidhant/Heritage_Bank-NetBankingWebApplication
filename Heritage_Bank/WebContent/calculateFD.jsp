<%@ page language="java" contentType="text/plain; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String principalStr = request.getParameter("principal");
    String fdInterestRateStr = request.getParameter("fdInterestRate");
    String fdTenureStr = request.getParameter("fdTenure");

    if (principalStr != null && fdInterestRateStr != null && fdTenureStr != null) {
        double principal = Double.parseDouble(principalStr);
        double fdInterestRate = Double.parseDouble(fdInterestRateStr);
        double fdTenure = Double.parseDouble(fdTenureStr);

        double maturityAmount = principal * Math.pow(1 + (fdInterestRate / 100), fdTenure);

        out.println("<strong>Maturity Amount:</strong> ₹" + String.format("%.2f", maturityAmount));
    } else {
        out.println("Invalid input. Please try again.");
    }
%>