package com.easthome.entity;

import java.util.Objects;

public class ShoppingCar {
    private Integer id;
    private String goods_id;
    private String goods_photo;
    private String goods_name;
    private Double goods_money;
    private Integer goods_number;
    private Double goods_total;
    private Integer user_id;

    public ShoppingCar() {
    }

    public ShoppingCar(Integer id, String goods_id, String goods_photo, String goods_name, Double goods_money, Integer goods_number, Double goods_total, Integer user_id) {
        this.id = id;
        this.goods_id = goods_id;
        this.goods_photo = goods_photo;
        this.goods_name = goods_name;
        this.goods_money = goods_money;
        this.goods_number = goods_number;
        this.goods_total = goods_total;
        this.user_id = user_id;
    }

    @Override
    public String toString() {
        return "ShoppingCar{" +
                "id=" + id +
                ", goods_id='" + goods_id + '\'' +
                ", goods_photo='" + goods_photo + '\'' +
                ", goods_name='" + goods_name + '\'' +
                ", goods_money=" + goods_money +
                ", goods_number=" + goods_number +
                ", goods_total=" + goods_total +
                ", user_id=" + user_id +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ShoppingCar that = (ShoppingCar) o;
        return Objects.equals(id, that.id) && Objects.equals(goods_id, that.goods_id) && Objects.equals(goods_photo, that.goods_photo) && Objects.equals(goods_name, that.goods_name) && Objects.equals(goods_money, that.goods_money) && Objects.equals(goods_number, that.goods_number) && Objects.equals(goods_total, that.goods_total) && Objects.equals(user_id, that.user_id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, goods_id, goods_photo, goods_name, goods_money, goods_number, goods_total, user_id);
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public ShoppingCar(String goods_id, String goods_photo, String goods_name, Double goods_money, Integer goods_number, Double goods_total, Integer user_id) {

        this.goods_id = goods_id;
        this.goods_photo = goods_photo;
        this.goods_name = goods_name;
        this.goods_money = goods_money;
        this.goods_number = goods_number;
        this.goods_total = goods_total;
        this.user_id = user_id;
    }

    public String getGoods_id() {
        return goods_id;
    }

    public void setGoods_id(String goods_id) {
        this.goods_id = goods_id;
    }

    public String getGoods_photo() {
        return goods_photo;
    }

    public void setGoods_photo(String goods_photo) {
        this.goods_photo = goods_photo;
    }

    public String getGoods_name() {
        return goods_name;
    }

    public void setGoods_name(String goods_name) {
        this.goods_name = goods_name;
    }

    public Double getGoods_money() {
        return goods_money;
    }

    public void setGoods_money(Double goods_money) {
        this.goods_money = goods_money;
    }

    public Integer getGoods_number() {
        return goods_number;
    }

    public void setGoods_number(Integer goods_number) {
        this.goods_number = goods_number;
    }

    public Double getGoods_total() {
        return goods_total;
    }

    public void setGoods_total(Double goods_total) {
        this.goods_total = goods_total;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }
}
