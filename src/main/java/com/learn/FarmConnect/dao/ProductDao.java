package com.learn.FarmConnect.dao;

import com.learn.FarmConnect.entities.Product;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class ProductDao {
    private final SessionFactory factory;

    public ProductDao(SessionFactory factory) {
        if (factory == null) {
            throw new IllegalArgumentException("SessionFactory cannot be null");
        }
        this.factory = factory;
    }

    public boolean saveProduct(Product product) {
        boolean success = false;
        try (Session session = this.factory.openSession()) {
            Transaction tx = session.beginTransaction();
            try {
                session.persist(product);  // Changed from save() to persist()
                tx.commit();
                success = true;
            } catch (Exception e) {
                tx.rollback();
                e.printStackTrace();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }

    public List<Product> getAllProducts() {
        try (Session session = this.factory.openSession()) {
            Query<Product> query = session.createQuery("FROM Product", Product.class);
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return List.of(); // Return empty list instead of null
        }
    }

    public List<Product> getAllProductsById(int cid) {
        try (Session session = this.factory.openSession()) {
            Query<Product> query = session.createQuery(
                "FROM Product p WHERE p.category.categoryId = :id", 
                Product.class
            );
            query.setParameter("id", cid);
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return List.of(); // Return empty list instead of null
        }
    }
}