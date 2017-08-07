/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfWriter;
import java.awt.Desktop;
import java.io.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author alydoubleza
 */
public class PDF {
    
    public void createPDF(User currUser, User currOfficer, Appointment appointment, Transaction transaction, Requirements requirement)
    {
        String temp, s;
        
        StringBuilder stringBuilder = new StringBuilder();
        for (int i = 0; i < requirement.getReqList().size(); i++)
        {
            s = i+1 + ". " +requirement.getReqList().get(i);
            stringBuilder.append(s);
            stringBuilder.append("\n");
            
        }
        String content = stringBuilder.toString();
        
        temp = "Bureau of Internal Revenue\nE-PPOINTMENT Stub\n\nClient Last Name: "+currUser.getLast_name()+"\nClient First Name: "+currUser.getFirst_name()+"\nClient Middle Initial: "+currUser.getMiddle_initial()+
                "\n\nAppointment Details\nRevenue Officer: "+currOfficer.getFirst_name()+" "+currOfficer.getMiddle_initial()+" "+currOfficer.getLast_name()+
                "\nAppointment Date: "+appointment.getDate()+"\nAppointment Time: "+appointment.getTime()+
                "\nAppointment Status: "+appointment.getStatus()+"\nAppointment Transaction: "+transaction.getName()+
                "\n\nTransaction Requirements:\n"+content+"\n";
        
        
        /*try {
            PdfReader pdfReader = new PdfReader("bir-appointment.pdf");
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }*/
            
            Document document = new Document();
            try {
            PdfWriter.getInstance(document, new FileOutputStream("bir-appointment.pdf"));
            
            document.open();
            document.add(new Paragraph(temp));
            document.close();
            
            } catch (Exception e) {
            e.printStackTrace();
            }
    }
    
}
