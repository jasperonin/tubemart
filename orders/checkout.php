<div class="content py-3">
    <div class="card card-outline card-primary shadow rounded-0">
        <div class="card-header">
            <div class="h5 card-title">Checkout</div>
        </div>
        <div class="card-body">
            <div class ="row">
                <div class="col-md-8 ">
                    <form action="" id="checkout-form">
                        <div class="form-group">
                                <label for="delivery_address" class="control-label col-md-5">Select Address</label>
                                <select name="delivery_address" id="delivery_address" row ="2" class="form-control" data-role="select-dropdown" data-profile="minimal"><?= $_settings->userdata('address') ?>
                                <option value="Poblacion 1"></option>
                                <option value="Poblacion 1">Poblacion I</option>
                                <option value="Poblacion 1">Poblacion II</option>
                                <option value="Poblacion 1">Poblacion III</option>
                                <option value="Poblacion 1">Poblacion IV</option>
                                <option value="Poblacion 1">Poblacion V</option>
                                <option value="Poblacion 1">Poblacion VI</option>
                                <option value="Poblacion 1">Poblacion VII</option>
                                <option value="Poblacion 1">Poblacion VIII</option>
                                </select>
                            <!-- <textarea name="delivery_address" id="delivery_address" rows="4" class="form-control rounded-0" required><?= $_settings->userdata('address') ?></textarea>-->
                        </div>
                        <div class="form-group text-right">
                            <button class="btn btn-flat btn-default btn-sm bg-navy">Place Order</button>
                        </div>
                    </form>
                </div>
                <div class="col-md-4">
                    <div class="row" id="summary">
                    <div class="col-12 border">
                        <h2 class="text-center"><b>Summary</b></h2>
                    </div>
                    <?php 
                    $gtotal = 0;
                    $vendors = $conn->query("SELECT * FROM `vendor_list` where id in (SELECT vendor_id from product_list where id in (SELECT product_id FROM `cart_list` where client_id ='{$_settings->userdata('id')}')) order by `shop_name` asc");
                    while($vrow=$vendors->fetch_assoc()):    
                    $vtotal = $conn->query("SELECT sum(c.quantity * p.price) FROM `cart_list` c inner join product_list p on c.product_id = p.id where c.client_id = '{$_settings->userdata('id')}' and p.vendor_id = '{$vrow['id']}'")->fetch_array()[0];   
                    $vtotal = $vtotal > 0 ? $vtotal : 0;
                    $gtotal += $vtotal + 50;
                    ?>
                    
                    <div class="col-12 border item">
                        <b class="text-muted">Shop name: <?= $vrow['shop_name'] ?></b>
                        <br>
                        <div class="text-right">Shipping Fee:   (<?= $vrow['fee']?>)</div>
                        <div class="text-right">Order Total: <?= format_num($vtotal) ?></div>
                    </div>
                    <?php endwhile; ?>
                    <div class="col-12 border">
                        <b class="text-muted">Grand Total</b>
                        <div class="text-right h3" id="total"><b><?= format_num($gtotal) ?></b></div>
                    </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $('#checkout-form').submit(function(e){
        e.preventDefault()
        var _this = $(this)
        if(_this[0].checkValidity() == false){
            _this[0].reportValidity()
            return false;
        }
        if($('#summary .item').length <= 0){
            alert_toast("There is no order listed in the cart yet.",'error')
            return false;
        }
        $('.pop_msg').remove();
        var el = $('<div>')
            el.addClass("alert alert-danger pop_msg")
            el.hide()
        start_loader()
        $.ajax({
            url:_base_url_+'classes/Master.php?f=place_order',
            method:'POST',
            data:_this.serialize(),
            dataType:'json',
            error:err=>{
                console.error(err)
                alert_toast("An error occurred.",'error')
                end_loader()
            },
            success:function(resp){
                if(resp.status == 'success'){
                    location.replace('./?page=products')
                }else if(!!resp.msg){
                    el.text(resp.msg)
                    _this.prepend(el)
                    el.show('slow')
                    $('html,body').scrollTop(0)
                }else{
                    el.text("An error occurred.")
                    _this.prepend(el)
                    el.show('slow')
                    $('html,body').scrollTop(0)
                }
                end_loader()
            }
        })
    })
</script>