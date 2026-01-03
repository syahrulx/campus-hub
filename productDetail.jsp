<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp" />

    <!-- Breadcrumb -->
    <div class="container" style="margin-top: 80px">
      <ol class="breadcrumb">
        <li><a href="userHome.html">Home</a></li>
        <li><a href="categories.html">Electronics</a></li>
        <li class="active">iPhone 13 Pro</li>
      </ol>
    </div>

    <!-- Main Content -->
    <div class="main-content" style="padding-top: 0">
      <div class="container">
        <div class="row">
          <!-- Product Images -->
          <div class="col-md-6">
            <div class="panel panel-default">
              <div class="panel-body" style="padding: 0">
                <img
                  src="images/iPhone.webp"
                  alt="iPhone 13 Pro"
                  style="
                    width: 100%;
                    height: 400px;
                    object-fit: cover;
                    border-radius: 4px;
                  "
                />
              </div>
            </div>
            <div class="row" style="margin-top: 10px">
              <div class="col-xs-3">
                <img
                  src="images/iPhone.webp"
                  alt="Thumbnail 1"
                  style="
                    width: 100%;
                    height: 80px;
                    object-fit: cover;
                    border: 2px solid var(--primary);
                    border-radius: 4px;
                    cursor: pointer;
                  "
                />
              </div>
              <div class="col-xs-3">
                <img
                  src="images/profile.jpg"
                  alt="Thumbnail 2"
                  style="
                    width: 100%;
                    height: 80px;
                    object-fit: cover;
                    border: 1px solid #ddd;
                    border-radius: 4px;
                    cursor: pointer;
                  "
                />
              </div>
              <div class="col-xs-3">
                <img
                  src="images/profile.jpg"
                  alt="Thumbnail 3"
                  style="
                    width: 100%;
                    height: 80px;
                    object-fit: cover;
                    border: 1px solid #ddd;
                    border-radius: 4px;
                    cursor: pointer;
                  "
                />
              </div>
              <div class="col-xs-3">
                <img
                  src="images/profile.jpg"
                  alt="Thumbnail 4"
                  style="
                    width: 100%;
                    height: 80px;
                    object-fit: cover;
                    border: 1px solid #ddd;
                    border-radius: 4px;
                    cursor: pointer;
                  "
                />
              </div>
            </div>
          </div>

          <!-- Product Details -->
          <div class="col-md-6">
            <h2 style="margin-top: 0; font-weight: 600">
              APPLE iPhone 13 Pro (128GB)
            </h2>

            <div style="margin: 15px 0">
              <span class="label label-success">Available</span>
              <span class="label label-default">Used - Like New</span>
            </div>

            <p class="price" style="font-size: 28px; margin: 20px 0">
              RM 5,000.00
            </p>

            <p style="color: #666; line-height: 1.8">
              Selling my iPhone 13 Pro 128GB in excellent condition. Bought last
              year, always used with a case and screen protector. Battery health
              at 92%. Comes with original box, charger, and a free case. No
              scratches or dents. Perfect for students who want a premium phone
              at a lower price.
            </p>

            <hr />

            <!-- Product Info -->
            <table class="table" style="margin-bottom: 20px">
              <tr>
                <td style="border: none; padding: 8px 0">
                  <strong>Category</strong>
                </td>
                <td style="border: none; padding: 8px 0">Electronics</td>
              </tr>
              <tr>
                <td style="border: none; padding: 8px 0">
                  <strong>Condition</strong>
                </td>
                <td style="border: none; padding: 8px 0">Used - Like New</td>
              </tr>
              <tr>
                <td style="border: none; padding: 8px 0">
                  <strong>Location</strong>
                </td>
                <td style="border: none; padding: 8px 0">UTM Skudai, Johor</td>
              </tr>
              <tr>
                <td style="border: none; padding: 8px 0">
                  <strong>Posted</strong>
                </td>
                <td style="border: none; padding: 8px 0">2 days ago</td>
              </tr>
            </table>

            <!-- Action Buttons -->
            <div style="display: flex; gap: 10px; margin-bottom: 20px">
              <a
                href="cartDetails.jsp"
                class="btn btn-primary btn-lg"
                style="flex: 1"
              >
                <span class="glyphicon glyphicon-shopping-cart"></span> Add to
                Cart
              </a>
              <a href="wishlist.html" class="btn btn-default btn-lg">
                <span class="glyphicon glyphicon-heart"></span>
              </a>
            </div>

            <a href="payment.html" class="btn btn-success btn-lg btn-block">
              Buy Now
            </a>

            <hr />

            <!-- Seller Info -->
            <div class="panel panel-default">
              <div class="panel-heading">
                <h4 style="margin: 0">Seller Information</h4>
              </div>
              <div class="panel-body">
                <div style="display: flex; align-items: center; gap: 15px">
                  <img
                    src="images/profile.jpg"
                    alt="Seller"
                    style="
                      width: 60px;
                      height: 60px;
                      border-radius: 50%;
                      object-fit: cover;
                    "
                  />
                  <div style="flex: 1">
                    <h5 style="margin: 0 0 5px 0">
                      <a
                        href="sellerProfile.html"
                        style="color: var(--text-dark)"
                        >Ahmad Faiz</a
                      >
                    </h5>
                    <div style="color: #f39c12">
                      <span class="glyphicon glyphicon-star"></span>
                      <span class="glyphicon glyphicon-star"></span>
                      <span class="glyphicon glyphicon-star"></span>
                      <span class="glyphicon glyphicon-star"></span>
                      <span class="glyphicon glyphicon-star-empty"></span>
                      <span style="color: #666; margin-left: 5px"
                        >4.2 (15 reviews)</span
                      >
                    </div>
                    <p style="margin: 5px 0 0 0; color: #666; font-size: 12px">
                      Member since Jan 2023 | 23 items sold
                    </p>
                  </div>
                </div>
                <div style="margin-top: 15px; display: flex; gap: 10px">
                  <a
                    href="messages.html"
                    class="btn btn-default"
                    style="flex: 1"
                  >
                    <span class="glyphicon glyphicon-envelope"></span> Message
                    Seller
                  </a>
                  <a
                    href="sellerProfile.html"
                    class="btn btn-default"
                    style="flex: 1"
                  >
                    View Profile
                  </a>
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- Related Products -->
        <div style="margin-top: 40px">
          <h3 class="page-title">Related Products</h3>
          <div class="row">
            <div class="col-sm-4 col-md-3">
              <div class="thumbnail">
                <img src="images/iPhone.webp" alt="Samsung Galaxy" />
                <div class="caption">
                  <p class="productname">Samsung Galaxy S21 Ultra</p>
                  <p class="productinfo">
                    Ultimate smartphone with stunning display
                  </p>
                  <p class="price">RM 3,500.00</p>
                  <a href="productDetail.jsp" class="btn btn-primary btn-block"
                    >View Details</a
                  >
                </div>
              </div>
            </div>
            <div class="col-sm-4 col-md-3">
              <div class="thumbnail">
                <img src="images/iPhone.webp" alt="iPhone 12" />
                <div class="caption">
                  <p class="productname">iPhone 12 (64GB)</p>
                  <p class="productinfo">Great condition with accessories</p>
                  <p class="price">RM 2,800.00</p>
                  <a href="productDetail.jsp" class="btn btn-primary btn-block"
                    >View Details</a
                  >
                </div>
              </div>
            </div>
            <div class="col-sm-4 col-md-3">
              <div class="thumbnail">
                <img src="images/airpods.png" alt="AirPods" />
                <div class="caption">
                  <p class="productname">Apple AirPods Pro</p>
                  <p class="productinfo">Noise cancellation, like new</p>
                  <p class="price">RM 800.00</p>
                  <a href="productDetail.jsp" class="btn btn-primary btn-block"
                    >View Details</a
                  >
                </div>
              </div>
            </div>
            <div class="col-sm-4 col-md-3">
              <div class="thumbnail">
                <img src="images/airpods.png" alt="Apple Watch" />
                <div class="caption">
                  <p class="productname">Apple Watch Series 7</p>
                  <p class="productinfo">45mm GPS, excellent condition</p>
                  <p class="price">RM 1,200.00</p>
                  <a href="productDetail.jsp" class="btn btn-primary btn-block"
                    >View Details</a
                  >
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

<jsp:include page="footer.jsp" />

</body>
</html>
