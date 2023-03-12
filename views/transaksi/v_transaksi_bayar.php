<?php
session_start();



include_once '../template/header.php';
include_once '../template/sidebar.php';
include_once '../template/topbar.php';
?>

<?php 

	include_once '../../controllers/c_transaksi.php';
	include_once '../../controllers/c_produk.php';
	include_once '../../controllers/c_pelanggan.php';

	$tr = new c_transaksi();
	$paket = new c_produk();
	$pelanggan = new c_pelanggan();


?>

<!-- page content -->
<div class="right_col" role="main">
	<div class="">
		<div class="page-title">
			<div class="title_left">
				<h3> Bayar Laundry </small></h3>
			</div>

			<div class="title_right">
				<div class="col-md-5 col-sm-5   form-group pull-right top_search">
				
				</div>
			</div>
		</div>

		<div class="clearfix"></div>

		<!-- start form  -->
		<div class="row">
			<div class="col-md-12 col-sm-12 ">
				<div class="x_panel">
					<div class="x_title">
						<h2>Form Design <small>different form elements</small></h2>
						
						<div class="clearfix"></div>
					</div>
					<div class="x_content">
						<br />
						<form action="../../routers/r_transaksi.php?aksi=bayar" method="POST" data-parsley-validate class="form-horizontal form-label-left">

                            <?php foreach ($tr->total_cucian($_GET['id']) as $t) { ?>

							<div class="item form-group">
								<div class="col-md-6 col-sm-6 ">
									<input type="text" id="id" name="id" class="form-control" value="<?= $t['id'] ?>" hidden>
								</div>
							</div>

                            <div class="item form-group">
								<label for="outlet" class="col-form-label col-md-3 col-sm-3 label-align">Kode Invoice</label>
								<div class="col-md-6 col-sm-6 ">
									<input type="text" id="id" name="kode_invoice" class="form-control " value="<?= $t['kode_invoice'] ?>" readonly>
								</div>
							</div>

                            <div class="item form-group">
								<label for="outlet" class="col-form-label col-md-3 col-sm-3 label-align">Nama Pelanggan</label>
								<div class="col-md-6 col-sm-6 ">
									<input type="text" id="id" name="kode_invoice" class="form-control " value="<?= $t['membernama'] ?>" readonly>
								</div>
							</div>

                            <div class="item form-group">
											<label class="col-form-label col-md-3 col-sm-3 label-align">Tanggal Bayar <span class="required"></span>
											</label>
											<div class="col-md-6 col-sm-6 ">
												<input id="birthday" class="date-picker form-control" name ="tgl_bayar" placeholder="dd-mm-yyyy" type="text" required="required" type="text" onfocus="this.type='date'" onmouseover="this.type='date'" onclick="this.type='date'" onblur="this.type='text'" onmouseout="timeFunctionLong(this)">
												<script>
													function timeFunctionLong(input) {
														setTimeout(function() {
															input.type = 'text';
														}, 60000);
													}
												</script>
											</div>
										</div>
                            
                            <div class="item form-group">
								<label class="col-form-label col-md-3 col-sm-3 label-align" for="qty"> Harga Paket <span class="required"></span>
								</label>
								<div class="col-md-6 col-sm-6 ">
									<input type="text" id="qty" name="qty" class="form-control" value="<?= $t['p_harga'] ?>" readonly>
								</div>
							</div>

                            <div class="item form-group">
								<label class="col-form-label col-md-3 col-sm-3 label-align" for="qty"> Qty / kg <span class="required"></span>
								</label>
								<div class="col-md-6 col-sm-6 ">
									<input type="text" id="qty" name="qty" class="form-control" value="<?= $t['t_qty'] ?>" readonly>
								</div>
							</div>
                            
                            <?php 

                                $hasil['hasil'] = $t['p_harga']*$t['t_qty'];
                            ?>

                            <div class="item form-group">
								<label for="outlet" class="col-form-label col-md-3 col-sm-3 label-align">Total Bayar</label>
								<div class="col-md-6 col-sm-6 ">
									<input type="text" id="id" name="total_bayar" class="form-control " value="<?= $hasil['hasil'] ?>" readonly>
								</div>
							</div>

                            <div class="item form-group">
								<!-- <label class="col-form-label col-md-3 col-sm-3 label-align" for="keterangan"> Keterangan <span class="required"></span> -->
								</label>
								<div class="col-md-6 col-sm-6 ">
									<input type="text" id="dibayar" name="dibayar" value="dibayar" class="form-control" hidden>
								</div>
							</div>
							
							<div class="ln_solid"></div>
							<div class="item form-group">
								<div class="col-md-6 col-sm-6 offset-md-3">
									<button class="btn btn-primary" type="submit" name="bayar">Bayar</button>
								</div>
							</div>
                        <?php } ?>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- end form  -->

	</div>
</div>
<!-- /page content -->


<?php include_once '../template/footer.php'; ?>