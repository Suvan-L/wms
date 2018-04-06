package org.suvan.cms.dao.model;

import java.io.Serializable;

public class CmsSupplier implements Serializable {
    /**
     * 编号（自增 id）
     *
     * @mbg.generated
     */
    private Integer supplierId;

    /**
     * 公司
     *
     * @mbg.generated
     */
    private String company;

    /**
     * 地址
     *
     * @mbg.generated
     */
    private String address;

    /**
     * 联系人
     *
     * @mbg.generated
     */
    private String name;

    /**
     * 电话
     *
     * @mbg.generated
     */
    private String tel;

    /**
     * 邮箱
     *
     * @mbg.generated
     */
    private String email;

    /**
     * 创建时间
     *
     * @mbg.generated
     */
    private Long ctime;

    private static final long serialVersionUID = 1L;

    public Integer getSupplierId() {
        return supplierId;
    }

    public void setSupplierId(Integer supplierId) {
        this.supplierId = supplierId;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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
        sb.append(", supplierId=").append(supplierId);
        sb.append(", company=").append(company);
        sb.append(", address=").append(address);
        sb.append(", name=").append(name);
        sb.append(", tel=").append(tel);
        sb.append(", email=").append(email);
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
        CmsSupplier other = (CmsSupplier) that;
        return (this.getSupplierId() == null ? other.getSupplierId() == null : this.getSupplierId().equals(other.getSupplierId()))
            && (this.getCompany() == null ? other.getCompany() == null : this.getCompany().equals(other.getCompany()))
            && (this.getAddress() == null ? other.getAddress() == null : this.getAddress().equals(other.getAddress()))
            && (this.getName() == null ? other.getName() == null : this.getName().equals(other.getName()))
            && (this.getTel() == null ? other.getTel() == null : this.getTel().equals(other.getTel()))
            && (this.getEmail() == null ? other.getEmail() == null : this.getEmail().equals(other.getEmail()))
            && (this.getCtime() == null ? other.getCtime() == null : this.getCtime().equals(other.getCtime()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getSupplierId() == null) ? 0 : getSupplierId().hashCode());
        result = prime * result + ((getCompany() == null) ? 0 : getCompany().hashCode());
        result = prime * result + ((getAddress() == null) ? 0 : getAddress().hashCode());
        result = prime * result + ((getName() == null) ? 0 : getName().hashCode());
        result = prime * result + ((getTel() == null) ? 0 : getTel().hashCode());
        result = prime * result + ((getEmail() == null) ? 0 : getEmail().hashCode());
        result = prime * result + ((getCtime() == null) ? 0 : getCtime().hashCode());
        return result;
    }
}