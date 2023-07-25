/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import sample.dto.Plant;
import sample.utils.DBUtils;

/**
 *
 * @author LENOVO
 */
public class PlanDAO {
    public static ArrayList<Plant> getPlants(String keyword, String searchby){
        ArrayList<Plant> list = new ArrayList();
        Connection cn = null;
        try{
            cn = DBUtils.makeConnection();
            if(cn!=null && searchby!= null){
                String sql="select PID, PName,price,imgPath,description,status,Plants.CateID as 'CateID',CateName\n"
                        +"from Plants join Categories on Plants.CateID = Categories.CateID\n";
                if(searchby.equalsIgnoreCase("by name")){
                    sql=sql+"where Plants.PName like ?";
                }else sql =sql +"where CateName like ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, "%"+keyword+"%");
                ResultSet rs=pst.executeQuery();
                if(rs!=null){
                    while(rs.next()){
                        int id =rs.getInt("PID");
                        String name = rs.getString("PName");
                        int price =rs.getInt("price");
                        String imgPath = rs.getString("imgPath");
                        String description = rs.getString("description");
                        int status =rs.getInt("status");
                        int cateID =rs.getInt("CateID");
                        String cateName = rs.getString("CateName");
                        Plant plant = new Plant(id, name, price, imgPath, description, status, cateID, cateName);
                        list.add(plant);
                    }
                }
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            try{
                cn.close();
            }catch(Exception e){
                e.printStackTrace();
            }
        }
        return list;
    }
    public static Plant getPlantByID(int PID){
        Connection cn = null;
        Plant plant=null;
        try{
            cn =  DBUtils.makeConnection();
        if(cn!=null){
            String sql = "select PID,PName,price,imgPath,description,status,Plants.CateID as CateID,CateName from Plants, Categories where Plants.CateID=Categories.CateID and PID =?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, PID);
            ResultSet rs=pst.executeQuery();
                if(rs!=null){
                    while(rs.next()){
                        int id =rs.getInt("PID");
                        String name = rs.getString("PName");
                        int price =rs.getInt("price");
                        String imgPath = rs.getString("imgPath");
                        String description = rs.getString("description");
                        int status =rs.getInt("status");
                        int cateID =rs.getInt("CateID");                       
                        plant = new Plant(id, name, price, imgPath, description, status, cateID, rs.getString("CateName"));                      
                    }
                }
        }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            try{
                cn.close();
            }catch(Exception e){
                e.printStackTrace();
            }
        }
        
        return plant;
    
    }
    public static boolean updatePlant(int id, String name, int price,String description, int status, int cateID){
         boolean update = false;
        Connection cn = null;
        int t=0;
        try {
            cn = DBUtils.makeConnection();
            if(cn!=null){
                cn.setAutoCommit(false); 
                String sql = "update Plants set PName=? , price=?, description=?, status=? ,CateID=? where PID=?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, name);
                pst.setInt(2, price);  
                pst.setString(3, description);
                pst.setInt(4, status);
                pst.setInt(5, cateID);
                pst.setInt(6, id);
                if(pst.executeUpdate() > 0){
                    return true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();            
        } finally {
            if (cn != null) {
                try {
                    cn.commit();
                    cn.setAutoCommit(true);
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }

        return update;
    }
    public static boolean insertPlant(String name, int price, String imgPath,String description, int status, int cateID){
         boolean update = false;
        Connection cn = null;
        int t=0;
        try {
            cn = DBUtils.makeConnection();
            if(cn!=null){
                cn.setAutoCommit(false); 
                String sql = "insert into Plants values(?,?,?,?,?,?)";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, name);
                pst.setInt(2, price);  
                pst.setString(3, imgPath);
                pst.setString(4, description);
                pst.setInt(5, status);
                pst.setInt(6, cateID);
                if(pst.executeUpdate() > 0){
                    return true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();            
        } finally {
            if (cn != null) {
                try {
                    cn.commit();
                    cn.setAutoCommit(true);
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }

        return update;
    }
}
