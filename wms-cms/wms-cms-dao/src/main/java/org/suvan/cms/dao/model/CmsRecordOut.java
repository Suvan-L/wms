package org.suvan.cms.dao.model;

import java.io.Serializable;

public class CmsRecordOut implements Serializable {
    /**
     * 编号（自增 id）
     *
     * @mbg.generated
     */
    private Integer recordOutId;

    /**
     * 客户 id
     *
     * @mbg.generated
     */
    private Integer customerId;

    /**
     * 货物 id
     *
     * @mbg.generated
     */
    private Integer goodsId;

    /**
     * 仓库 id
     *
     * @mbg.generated
     */
    private Integer warehouseId;

    /**
     * 出库数量
     *
     * @mbg.generated
     */
    private Integer amount;

    /**
     * 创建时间
     *
     * @mbg.generated
     */
    private Long ctime;

    private static final long serialVersionUID = 1L;

    public Integer getRecordOutId() {
        return recordOutId;
    }

    public void setRecordOutId(Integer recordOutId) {
        this.recordOutId = recordOutId;
    }

    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
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

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    public Long getCtime() {
        return ctime;
    }

    public void setCtime(Long ctime) {
        this.ctime = ctime;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", recordOutId=").append(recordOutId);
        sb.append(", customerId=").append(customerId);
        sb.append(", goodsId=").append(goodsId);
        sb.append(", warehouseId=").append(warehouseId);
        sb.append(", amount=").append(amount);
        sb.append(", ctime=").append(ctime);
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
        CmsRecordOut other = (CmsRecordOut) that;
        return (this.getRecordOutId() == null ? other.getRecordOutId() == null : this.getRecordOutId().equals(other.getRecordOutId()))
            && (this.getCustomerId() == null ? other.getCustomerId() == null : this.getCustomerId().equals(other.getCustomerId()))
            && (this.getGoodsId() == null ? other.getGoodsId() == null : this.getGoodsId().equals(other.getGoodsId()))
            && (this.getWarehouseId() == null ? other.getWarehouseId() == null : this.getWarehouseId().equals(other.getWarehouseId()))
            && (this.getAmount() == null ? other.getAmount() == null : this.getAmount().equals(other.getAmount()))
            && (this.getCtime() == null ? other.getCtime() == null : this.getCtime().equals(other.getCtime()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getRecordOutId() == null) ? 0 : getRecordOutId().hashCode());
        result = prime * result + ((getCustomerId() == null) ? 0 : getCustomerId().hashCode());
        result = prime * result + ((getGoodsId() == null) ? 0 : getGoodsId().hashCode());
        result = prime * result + ((getWarehouseId() == null) ? 0 : getWarehouseId().hashCode());
        result = prime * result + ((getAmount() == null) ? 0 : getAmount().hashCode());
        result = prime * result + ((getCtime() == null) ? 0 : getCtime().hashCode());
        return result;
    }
}