/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.proyectopulperialafortaleza;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 *
 * @author PRUEBA
 */
public class Conexion {
    
        Connection conectar = null;
        
        String usuario ="postgres";
        String contraseña= "12345678";
        String bd = "PulperiaLaFortaleza";
        String ip = "localhost";
        String Puerto = "5432";
        
        String cadena ="jdbc:postgresql://"+ip+":"+Puerto+"/"+bd;
        
        public Connection establecerConexion(){
            try{
                Class.forName("org.postgresql.Driver");
                conectar = DriverManager.getConnection(cadena, usuario, contraseña);
                JOptionPane.showMessageDialog(null, "Se conecto correctamente a la Base de Datos");
                
            }catch (Exception e){
                JOptionPane.showMessageDialog(null, "Error al conectar a la Base de Datos, Error"+e.toString());
            }
            return conectar;
            
        }
        
        public void cerrarConexion(Connection conexion) {
        if (conexion != null) {
            try {
                conexion.close();
                JOptionPane.showMessageDialog(null, "Se cerró la conexión correctamente");
            } catch (Exception e) {
                JOptionPane.showMessageDialog(null, "Error al cerrar la conexión: " + e.toString());
            }
        }
    }

    
}
   
