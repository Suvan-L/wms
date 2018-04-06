package org.suvan.cms.dao.model;

import java.io.Serializable;

public class CmsWarehouse implements Serializable {
    /**
     * 编号（自增 id）
     *
     * @mbg.generated
     */
    private Integer warehouseId;

    /**
     * 地址
     *
     * @mbg.generated
     */
    private String address;

    /**
     * 仓库状态（0%：空闲，1% - 75%：正常， 75% - 90%：警告， 100%：满仓）
     *
     * @mbg.generated
     */
    private String status;

    /**
     * 区域面积
     *
     * @mbg.generated
     */
    private Integer area;

    /**
     * 已存放的所有货品面积总和
     *
     * @mbg.generated
     */
    private Integer goodsArea;

    /**
     * 现任管理员
     *
     * @mbg.generated
     */
    private String admin;

    private static final long serialVersionUID = 1L;

    public Integer getWarehouseId() {
        return warehouseId;
    }

    public void setWarehouseId(Integer warehouseId) {
        this.warehouseId = warehouseId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Integer getArea() {
        return area;
    }

    public void setArea(Integer area) {
        this.area = area;
    }

    public Integer getGoodsArea() {
        return goodsArea;
    }

    public void setGoodsArea(Integer goodsArea) {
        this.goodsArea = goodsArea;
    }

    public String getAdmin() {
        return admin;
    }

    public void setAdmin(String admin) {
        this.admin = admin;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", warehouseId=").append(warehouseId);
        sb.append(", address=").append(address);
        sb.append(", status=").append(status);
        sb.append(", area=").append(area);
        sb.append(", goodsArea=").append(goodsArea);
        sb.append(", admin=").append(admin);
        sb.append("]");
        return sb.toString();
    }

    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (that == null) {
            return false;
        }
        if (getClass() != that.getClass()) {
            return false;
        }
        CmsWarehouse other = (CmsWarehouse) that;
        return (this.getWarehouseId() == null ? other.getWarehouseId() == null : this.getWarehouseId().equals(other.getWarehouseId()))
            && (this.getAddress() == null ? other.getAddress() == null : this.getAddress().equals(other.getAddress()))
            && (this.getStatus() == null ? other.getStatus() == null : this.getStatus().equals(other.getStatus()))
            && (this.getArea() == null ? other.getArea() == null : this.getArea().equals(other.getArea()))
            && (this.getGoodsArea() == null ? other.getGoodsArea() == null : this.getGoodsArea().equals(other.getGoodsArea()))
            && (this.getAdmin() == null ? other.getAdmin() == null : this.getAdmin().equals(other.getAdmin()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getWarehouseId() == null) ? 0 : getWarehouseId().hashCode());
        result = prime * result + ((getAddress() == null) ? 0 : getAddress().hashCode());
        result = prime * result + ((getStatus() == null) ? 0 : getStatus().hashCode());
        result = prime * result + ((getArea() == null) ? 0 : getArea().hashCode());
        result = prime * result + ((getGoodsArea() == null) ? 0 : getGoodsArea().hashCode());
        result = prime * result + ((getAdmin() == null) ? 0 : getAdmin().hashCode());
        return result;
    }
}