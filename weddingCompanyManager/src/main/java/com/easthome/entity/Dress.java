package com.easthome.entity;

import java.util.Objects;

public class Dress {
    private Integer id;
    private String d_id;//编号
    private String d_photo;
    private String d_name;
    private Double d_money;

    public Dress() {
    }

    @Override
    public String toString() {
        return "Dress{" +
                "id=" + id +
                ", d_id='" + d_id + '\'' +
                ", d_photo='" + d_photo + '\'' +
                ", d_name='" + d_name + '\'' +
                ", d_money=" + d_money +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Dress dress = (Dress) o;
        return Objects.equals(id, dress.id) && Objects.equals(d_id, dress.d_id) && Objects.equals(d_photo, dress.d_photo) && Objects.equals(d_name, dress.d_name) && Objects.equals(d_money, dress.d_money);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, d_id, d_photo, d_name, d_money);
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getD_id() {
        return d_id;
    }

    public void setD_id(String d_id) {
        this.d_id = d_id;
    }

    public String getD_photo() {
        return d_photo;
    }

    public void setD_photo(String d_photo) {
        this.d_photo = d_photo;
    }

    public String getD_name() {
        return d_name;
    }

    public void setD_name(String d_name) {
        this.d_name = d_name;
    }

    public Double getD_money() {
        return d_money;
    }

    public void setD_money(Double d_money) {
        this.d_money = d_money;
    }

    public Dress(Integer id, String d_id, String d_photo, String d_name, Double d_money) {
        this.id = id;
        this.d_id = d_id;
        this.d_photo = d_photo;
        this.d_name = d_name;
        this.d_money = d_money;
    }
}
