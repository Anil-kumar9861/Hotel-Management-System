package com.hotel.service;

import com.hotel.model.BookingTable;
import com.lowagie.text.DocumentException;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public interface InvoiceGenerator {
    public void generate(HttpServletResponse response, BookingTable booking) throws IOException, DocumentException;
}
