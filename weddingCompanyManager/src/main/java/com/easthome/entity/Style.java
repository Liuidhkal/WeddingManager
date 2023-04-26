package com.easthome.entity;

import java.util.Objects;

public class Style {
    private Integer id;
    private String style_id;
    private String photo;
    private String s_name;
    private Double money;

    @Override
    public String toString() {
        return "Style{" +
                "id=" + id +
                ", style_id='" + style_id + '\'' +
                ", photo='" + photo + '\'' +
                ", s_name='" + s_name + '\'' +
                ", money=" + money +
                '}';
    }

    public Style() {
    }

    public Style(String s_name, Double money) {
        this.s_name = s_name;
        this.money = money;
    }

    public Style(String photo, String s_name, Double money) {
        this.photo = photo;
        this.s_name = s_name;
        this.money = money;
    }

    public Style(String style_id, String photo, String s_name, Double money) {
        this.style_id = style_id;
        this.photo = photo;
        this.s_name = s_name;
        this.money = money;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Style style = (Style) o;
        return Objects.equals(id, style.id) && Objects.equals(style_id, style.style_id) && Objects.equals(photo, style.photo) && Objects.equals(s_name, style.s_name) && Objects.equals(money, style.money);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, style_id, photo, s_name, money);
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStyle_id() {
        return style_id;
    }

    public void setStyle_id(String style_id) {
        this.style_id = style_id;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getS_name() {
        return s_name;
    }

    public void setS_name(String s_name) {
        this.s_name = s_name;
    }

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }

    public Style(Integer id, String style_id, String photo, String s_name, Double money) {
        this.id = id;
        this.style_id = style_id;
        this.photo = photo;
        this.s_name = s_name;
        this.money = money;
    }
}
