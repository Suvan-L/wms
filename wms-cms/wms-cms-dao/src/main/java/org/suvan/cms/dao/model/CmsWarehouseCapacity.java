package org.suvan.cms.dao.model;

import java.io.Serializable;

public class CmsWarehouseCapacity implements Serializable {
    /**
     * 编号（自增 id）
     *
     * @mbg.generated
     */
    private Integer warehouseCapacityId;

    /**
     * 货物编号（货物表 id）
     *
     * @mbg.generated
     */
    private Integer goodsId;

    /**
     * 仓库编号（仓库信息表 id）
     *
     * @mbg.generated
     */
    private Integer warehouseId;

    /**
     * 使用面积（货品表 size * count）
     *
     * @mbg.generated
     */
    private Integer useArea;

    private static final long serialVersionUID = 1L;

    public Integer getWarehouseCapacityId() {
        return warehouseCapacityId;
    }

    public void setWarehouseCapacityId(Integer warehouseCapacityId) {
        this.warehouseCapacityId = warehouseCapacityId;
    }

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public Integer getWarehouseId() {
        return warehouseId;
    }

    public void setWarehouseId(Integer warehouseId) {
        this.warehouseId = warehouseId;
    }

    public Integer getUseArea() {
        return useArea;
    }

    public void setUseArea(Integer useArea) {
        this.useArea = useArea;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", warehouseCapacityId=").append(warehouseCapacityId);
        sb.append(", goodsId=").append(goodsId);
        sb.append(", warehouseId=").append(warehouseId);
        sb.append(", useArea=").append(useArea);
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
        CmsWarehouseCapacity other = (CmsWarehouseCapacity) that;
        return (this.getWarehouseCapacityId() == null ? other.getWarehouseCapacityId() == null : this.getWarehouseCapacityId().equals(other.getWarehouseCapacityId()))
            && (this.getGoodsId() == null ? other.getGoodsId() == null : this.getGoodsId().equals(other.getGoodsId()))
            && (this.getWarehouseId() == null ? other.getWarehouseId() == null : this.getWarehouseId().equals(other.getWarehouseId()))
            && (this.getUseArea() == null ? other.getUseArea() == null : this.getUseArea().equals(other.getUseArea()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getWarehouseCapacityId() == null) ? 0 : getWarehouseCapacityId().hashCode());
        result = prime * result + ((getGoodsId() == null) ? 0 : getGoodsId().hashCode());
        result = prime * result + ((getWarehouseId() == null) ? 0 : getWarehouseId().hashCode());
        result = prime * result + ((getUseArea() == null) ? 0 : getUseArea().hashCode());
        return result;
    }
}