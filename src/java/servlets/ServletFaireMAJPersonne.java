package servlets;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
import DAO.PersonneDAO;
import MemoryUser.Utilisateurs;
import Model.Personne;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author termine
 */
public class ServletFaireMAJPersonne extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String id = null, nom = null, prenom = null, adresse = null, ville = null;
        String result;
        
        try {
            if (HtmlHttpUtils.isAuthenticate(request)) {
                id = request.getParameter("id");
                System.out.println(id);
                
                nom = request.getParameter("nom");
                prenom = request.getParameter("prenom");
                adresse = request.getParameter("adresse");
                ville = request.getParameter("ville");
                
                if (!nom.equals("") && !prenom.equals("") && !adresse.equals("") && !ville.equals("")) {

                Personne p = new Personne(Long.parseLong(id), nom, prenom, adresse, ville);

                PersonneDAO pdao = new PersonneDAO();

                pdao.update(p);
                
                
                // cumul des points
                Utilisateurs.modifieScore((String) request.getSession(false).getAttribute("username"), 2);
                
                                            
                result = "maj_suc";
                request.setAttribute("result", result);
                request.getRequestDispatcher("gestionPersonne.jsp").forward(request, response);
                
                } else{
                    
                        if (nom.equals("")){
                            result = "maj_fail_nom";
                            request.setAttribute("result", result);
                            request.getRequestDispatcher("gestionPersonne.jsp").forward(request, response);  
                        }
                        if (prenom.equals("")){
                            result = "maj_fail_prenom";
                            request.setAttribute("result", result);
                            request.getRequestDispatcher("gestionPersonne.jsp").forward(request, response);                             
                        }
                        if (adresse.equals("")){
                            result = "maj_fail_adresse";
                            request.setAttribute("result", result);
                            request.getRequestDispatcher("gestionPersonne.jsp").forward(request, response);                             
                        }
                        if (ville.equals("")){
                            result = "maj_fail_ville";
                            request.setAttribute("result", result);
                            request.getRequestDispatcher("gestionPersonne.jsp").forward(request, response);                             
                        }
                }
                
            }

                request.getRequestDispatcher("/index.jsp").forward(request, response);
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
