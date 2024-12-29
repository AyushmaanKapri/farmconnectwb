
package com.learn.FarmConnect.dao;

import com.learn.FarmConnect.entities.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class UserDao {
    private SessionFactory factory;

    public UserDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    //get user by email and password
    public User getUserByPhoneAndPassword(String phone,String password)
    {
        User user=null;
        
        try {
            
            String query="from User where userPhone =: e and userPassword=: p";
            Session session = this.factory.openSession();
            Query q = (Query) session.createQuery(query);
            q.setParameter("e", phone);
            q.setParameter("p",password);            
            user=(User) q.uniqueResult();         
            session.close();        
            
        } catch (Exception e) {
            e.printStackTrace();
        }     
        
        
        
        
        return user;
    }
    
    
}
