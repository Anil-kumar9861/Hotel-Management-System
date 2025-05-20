<style>
    /* Breadcrumb section */
.breadcrumb-section {
    background: linear-gradient(to right, #007bff, #00c6ff);
    padding: 28px 0;
    color: white;
    text-align: center;
}
.breadcrumb-text h2 {
    font-size: 40px;
    font-weight: bold;
    font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
}
.breadcrumb-text .bt-option a,
.breadcrumb-text .bt-option span {
    color: #fff;
    font-size: 16px;
    margin: 0 5px;
}

/* Room section */
.rooms-section {
    background-color: #f9f9f9;
    padding: 60px 0;
}
.room-item {
    background-color: #fff;
    border-radius: 10px;
    overflow: hidden;
    margin-bottom: 30px;
    box-shadow: 0 5px 15px rgba(0,0,0,0.1);
    transition: transform 0.3s;
}
.room-item:hover {
    transform: translateY(-5px);
}
.room-item img {
    width: 100%;
    height: 250px;
    object-fit: cover;
}
.ri-text {
    padding: 20px;
}
.ri-text h4 {
    font-size: 22px;
    color: #333;
    margin-bottom: 10px;
}
.ri-text h4 {
    font-size: 24px;
    color: #007bff;
    margin-bottom: 15px;
}
.ri-text h3 span {
    font-size: 14px;
    color: #666;
}
.ri-text table {
    width: 100%;
    margin-bottom: 15px;
}
.ri-text .r-o {
    font-weight: bold;
    color: #555;
    width: 40%;
}
.primary-btn {
    display: inline-block;
    padding: 10px 20px;
    background-color: #007bff;
    color: white !important;
    border-radius: 6px;
    text-decoration: none;
    transition: background 0.3s;
}
.primary-btn:hover {
    background-color: #0056b3;
}

/* Book now button */
.book {
    margin-top: 10px;
    font-weight: bold;
    border-radius: 6px;
    transition: background-color 0.3s ease;
}
.book:hover {
    background-color: #ffc107d6;
}

/* Pagination */
.room-pagination {
    text-align: center;
    margin-top: 40px;
}
.room-pagination a {
    display: inline-block;
    margin: 0 8px;
    padding: 8px 16px;
    background-color: #007bff;
    color: white;
    border-radius: 4px;
    transition: background 0.3s;
    text-decoration: none;
}
.room-pagination a:hover {
    background-color: #0056b3;
}
</style>

    <!-- Breadcrumb Section Begin -->
    <div class="breadcrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <h2>Rooms</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section End -->

    <!-- Rooms Section Begin -->
    <section class="rooms-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-6">
                    <div class="room-item">
                        <img src="../assets/img/room-11.jpg" alt="room" />
                        <div class="ri-text">
                            <h4>Premium King Room</h4>
                            <p class="room-price">Rs.5400 <span>/ night</span></p>
                            <table>
                                <tbody>
                                    <tr>
                                        <td class="r-o">Size:</td>
                                        <td>30 ft</td>
                                    </tr>
                                    <tr>
                                        <td class="r-o">Capacity:</td>
                                        <td>Max person 3</td>
                                    </tr>
                                    <tr>
                                        <td class="r-o">Bed:</td>
                                        <td>King Beds</td>
                                    </tr>
                                    <tr>
                                        <td class="r-o">Services:</td>
                                        <td>Wifi, Television, Bathroom,...</td>
                                    </tr>
                                </tbody>
                            </table>
                            <button type="button" class="btn btn-primary bookbtn">Book Now</button>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="room-item">
                        <img src="../assets/img/room-22.jpg" alt="room" />
                        <div class="ri-text">
                            <h4>Deluxe Room</h4>
                            <p class="room-price">Rs.6000 <span>/ night</span></p>
                            <table>
                                <tbody>
                                    <tr>
                                        <td class="r-o">Size:</td>
                                        <td>30 ft</td>
                                    </tr>
                                    <tr>
                                        <td class="r-o">Capacity:</td>
                                        <td>Max person 5</td>
                                    </tr>
                                    <tr>
                                        <td class="r-o">Bed:</td>
                                        <td>King Beds</td>
                                    </tr>
                                    <tr>
                                        <td class="r-o">Services:</td>
                                        <td>Wifi, Television, Bathroom,...</td>
                                    </tr>
                                </tbody>
                            </table>
                            <button type="button" class="btn btn-primary bookbtn">Book Now</button>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="room-item">
                        <img src="../assets/img/room-33.jpg" alt="room" />
                        <div class="ri-text">
                            <h4>Double Room</h4>
                            <p class="room-price">Rs.7500 <span>/ night</span></p>
                            <table>
                                <tbody>
                                    <tr>
                                        <td class="r-o">Size:</td>
                                        <td>30 ft</td>
                                    </tr>
                                    <tr>
                                        <td class="r-o">Capacity:</td>
                                        <td>Max person 2</td>
                                    </tr>
                                    <tr>
                                        <td class="r-o">Bed:</td>
                                        <td>King Beds</td>
                                    </tr>
                                    <tr>
                                        <td class="r-o">Services:</td>
                                        <td>Wifi, Television, Bathroom,...</td>
                                    </tr>
                                </tbody>
                            </table>
                            <button type="button" class="btn btn-primary bookbtn">Book Now</button>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="room-item">
                        <img src="../assets/img/room-4.jpg" alt="room" />
                        <div class="ri-text">
                            <h4>Luxury Room</h4>
                            <p class="room-price">Rs.8500 <span>/ night</span></p>
                            <table>
                                <tbody>
                                    <tr>
                                        <td class="r-o">Size:</td>
                                        <td>30 ft</td>
                                    </tr>
                                    <tr>
                                        <td class="r-o">Capacity:</td>
                                        <td>Max person 1</td>
                                    </tr>
                                    <tr>
                                        <td class="r-o">Bed:</td>
                                        <td>King Beds</td>
                                    </tr>
                                    <tr>
                                        <td class="r-o">Services:</td>
                                        <td>Wifi, Television, Bathroom,...</td>
                                    </tr>
                                </tbody>
                            </table>
                            <button type="button" class="btn btn-primary bookbtn">Book Now</button>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="room-item">
                        <img src="../assets/img/room-5.jpg" alt="room" />
                        <div class="ri-text">
                            <h4>Room With View</h4>
                            <p class="room-price">Rs.8500 <span>/ night</span></p>
                            <table>
                                <tbody>
                                    <tr>
                                        <td class="r-o">Size:</td>
                                        <td>30 ft</td>
                                    </tr>
                                    <tr>
                                        <td class="r-o">Capacity:</td>
                                        <td>Max person 1</td>
                                    </tr>
                                    <tr>
                                        <td class="r-o">Bed:</td>
                                        <td>King Beds</td>
                                    </tr>
                                    <tr>
                                        <td class="r-o">Services:</td>
                                        <td>Wifi, Television, Bathroom,...</td>
                                    </tr>
                                </tbody>
                            </table>
                            <button type="button" class="btn btn-primary bookbtn">Book Now</button>
                        
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="room-item">
                        <img src="../assets/img/room-6.jpg" alt="room" />
                        <div class="ri-text">
                            <h4>Small View</h4>
                            <p class="room-price">Rs.9500 <span>/ night</span></p>
                            <table>
                                <tbody>
                                    <tr>
                                        <td class="r-o">Size:</td>
                                        <td>30 ft</td>
                                    </tr>
                                    <tr>
                                        <td class="r-o">Capacity:</td>
                                        <td>Max person 2</td>
                                    </tr>
                                    <tr>
                                        <td class="r-o">Bed:</td>
                                        <td>King Beds</td>
                                    </tr>
                                    <tr>
                                        <td class="r-o">Services:</td>
                                        <td>Wifi, Television, Bathroom,...</td>
                                    </tr>
                                </tbody>
                            </table>
                            <button type="button" class="btn btn-primary bookbtn">Book Now</button>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="room-pagination">
                        <a href="#">1</a>
                        <a href="#">2</a>
                        <a href="#">Next <i class="fa fa-long-arrow-right"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script>
        $(".bookbtn").on('click', function() {
            $(".modalSpace1").load("/bookForm", function(){
                $("#bookingmodel").modal('show');
              
            });
        });
        
    </script>