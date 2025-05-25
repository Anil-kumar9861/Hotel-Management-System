package com.hotel.service.impl;

import com.hotel.model.BookingTable;
import com.hotel.service.InvoiceGenerator;
import com.lowagie.text.*;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;


import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URL;
import java.util.Date;

public class InvoiceGeneratorImpl implements InvoiceGenerator {

    public void generate(HttpServletResponse response, BookingTable booking) throws IOException, DocumentException {
        Document document = new Document(PageSize.A4);
        PdfWriter.getInstance(document, response.getOutputStream());
        document.open();

        // Logo (if stored in static folder or accessible via URL)
        try {
            Image logo = Image.getInstance(new URL("https://i.pinimg.com/736x/10/ff/aa/10ffaadab6bc3c4c1dd4a3e44bf6d5ad.jpg")); // Replace with your actual logo URL
            logo.scaleToFit(100, 100);
            logo.setAlignment(Image.ALIGN_CENTER);
            document.add(logo);
        } catch (Exception e) {
            // Optional: fallback or skip
        }

        // Title
        Font titleFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 22);
        Paragraph title = new Paragraph("Hotel Booking Invoice", titleFont);
        title.setAlignment(Paragraph.ALIGN_CENTER);
        title.setSpacingBefore(10);
        title.setSpacingAfter(20);
        document.add(title);

        // Invoice Date
        Font smallBold = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12);
        document.add(new Paragraph("Invoice Date: " + new Date(), smallBold));
        document.add(Chunk.NEWLINE);

        // Booking Info Table
        PdfPTable table = new PdfPTable(2);
        table.setWidthPercentage(100f);
        table.setSpacingBefore(10f);
        table.setSpacingAfter(10f);
        table.setWidths(new float[]{2f, 4f});

        addTableRow(table, "Booking ID", booking.getBookingid());
        addTableRow(table, "Customer Name", booking.getUser().getUserName());
        addTableRow(table, "Room Number", booking.getRoom().getRoomNumber());
        addTableRow(table, "Check-In", booking.getCheckIn().toString());
        addTableRow(table, "Check-Out", booking.getCheckOut().toString());
        addTableRow(table, "Status", booking.getStatus());
        addTableRow(table, "Total Price", "₹" + booking.getTotalPrice());

        document.add(table);

        // Footer
        Paragraph thanks = new Paragraph("Thank you for choosing our hotel!", FontFactory.getFont(FontFactory.HELVETICA_OBLIQUE, 12));
        thanks.setAlignment(Element.ALIGN_CENTER);
        document.add(thanks);

        document.close();
    }

    private void addTableRow(PdfPTable table, String label, String value) {
        Font labelFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12);
        Font valueFont = FontFactory.getFont(FontFactory.HELVETICA, 12);

        PdfPCell cell1 = new PdfPCell(new Phrase(label, labelFont));
        PdfPCell cell2 = new PdfPCell(new Phrase(value != null ? value : "-", valueFont));

        cell1.setBorder(Rectangle.NO_BORDER);
        cell2.setBorder(Rectangle.NO_BORDER);

        table.addCell(cell1);
        table.addCell(cell2);
    }
}
