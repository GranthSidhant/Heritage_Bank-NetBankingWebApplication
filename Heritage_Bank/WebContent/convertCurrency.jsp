<%@ page language="java" contentType="text/plain; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String amountStr = request.getParameter("amount");
    String fromCurrency = request.getParameter("fromCurrency");
    String toCurrency = request.getParameter("toCurrency");

    if (amountStr != null && fromCurrency != null && toCurrency != null) {
        double amount = Double.parseDouble(amountStr);
        double convertedAmount = 0;

        // Hardcoded conversion rates (for demonstration)
        if (fromCurrency.equals("USD") && toCurrency.equals("INR")) {
            convertedAmount = amount * 82.5;
        } else if (fromCurrency.equals("EUR") && toCurrency.equals("INR")) {
            convertedAmount = amount * 89.2;
        } else if (fromCurrency.equals("INR") && toCurrency.equals("USD")) {
            convertedAmount = amount / 82.5;
        } else if (fromCurrency.equals("INR") && toCurrency.equals("EUR")) {
            convertedAmount = amount / 89.2;
        } else {
            convertedAmount = amount; // Same currency
        }

        out.println("<strong>Converted Amount:</strong> " + String.format("%.2f", convertedAmount) + " " + toCurrency);
    } else {
        out.println("Invalid input. Please try again.");
    }
%>