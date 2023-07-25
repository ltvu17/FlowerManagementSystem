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
import sample.dto.Category;
import sample.utils.DBUtils;

/**
 *
 * @author LENOVO
 */
public class CategoryDAO {
    public static ArrayList<Category> getCates() {
        Connection cn = null;
        Category cate = null;
        ArrayList<Category> list = new ArrayList<>();
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select * from  Categories";
                PreparedStatement pst = cn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        cate = new Category(rs.getInt(1), rs.getString(2));
                        list.add(cate);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return list;
    }
    public static boolean updateCate(int id, String name){
         boolean update = false;
        Connection cn = null;
        int t=0;
        try {
            cn = DBUtils.makeConnection();
            if(cn!=null){
                cn.setAutoCommit(false); 
                String sql = "update Categories set CateName=? where CateID=?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, name);
                pst.setInt(2, id);  
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
    public static boolean insertCate(String name){
         boolean update = false;
        Connection cn = null;
        int t=0;
        try {
            cn = DBUtils.makeConnection();
            if(cn!=null){
                cn.setAutoCommit(false); 
                String sql = "insert into Categories values(?)";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, name);
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
