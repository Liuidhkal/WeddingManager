package com.easthome.entity;

import java.util.Objects;

public class Weddingcar {
    private Integer id;
    private String c_id;//编号
    private String c_photo;//照片虚拟路径
    private String c_name;
    private Double c_money;
    private Integer c_count;//库存

    public Weddingcar() {
    }

    public Weddingcar(Integer id, String c_id, String c_photo, String c_name, Double c_money, Integer c_count) {
        this.id = id;
        this.c_id = c_id;
        this.c_photo = c_photo;
        this.c_name = c_name;
        this.c_money = c_money;
        this.c_count = c_count;
    }

    public Weddingcar(String c_id, Integer c_count) {
        this.c_id = c_id;
        this.c_count = c_count;
    }

    @Override
    public String toString() {
        return "Weddingcar{" +
                "id=" + id +
                ", c_id='" + c_id + '\'' +
                ", c_photo='" + c_photo + '\'' +
                ", c_name='" + c_name + '\'' +
                ", c_money=" + c_money +
                ", c_count=" + c_count +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Weddingcar that = (Weddingcar) o;
        return Objects.equals(id, that.id) && Objects.equals(c_id, that.c_id) && Objects.equals(c_photo, that.c_photo) && Objects.equals(c_name, that.c_name) && Objects.equals(c_money, that.c_money) && Objects.equals(c_count, that.c_count);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, c_id, c_photo, c_name, c_money, c_count);
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getC_id() {
        return c_id;
    }

    public void setC_id(String c_id) {
        this.c_id = c_id;
    }

    public String getC_photo() {
        return c_photo;
    }

    public void setC_photo(String c_photo) {
        this.c_photo = c_photo;
    }

    public String getC_name() {
        return c_name;
    }

    public void setC_name(String c_name) {
        this.c_name = c_name;
    }

    public Double getC_money() {
        return c_money;
    }

    public void setC_money(Double c_money) {
        this.c_money = c_money;
    }

    public Integer getC_count() {
        return c_count;
    }

    public void setC_count(Integer c_count) {
        this.c_count = c_count;
    }
}
