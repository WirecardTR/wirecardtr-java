<%@page import="java.util.UUID"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="wirecard.core.Settings"%>
<%@page import="wirecard.core.request.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@page
	contentType="text/html"
	pageEncoding="UTF-8"
%>
<title>Wirecard Developer Portal</title>
<link
	href="<%=request.getContextPath()%>/Content/css/bootstrap.min.css"
	rel="stylesheet"
	type="text/css"
/>
<link
	href="<%=request.getContextPath()%>/Content/css/jquery.mCustomScrollbar.min.css"
	rel="stylesheet"
	type="text/css"
/>
<link
	href="<%=request.getContextPath()%>/Content/css/style.css"
	rel="stylesheet"
	type="text/css"
/>
</head>
<body>
        
    
    <div class="wrapper">
           <nav id="sidebar">
            <div class="sidebar-header">
                <a href="/wirecard-java/index.htm"><img 
                        src="<%=request.getContextPath()%>/Content/img/logo.png"
                        width="130" height="26" /></a>
                
            </div>
            <ul class="list-unstyled components">
                <li>
                    <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false">Sms Ödeme Servisleri</a>
                    <ul class="collapse list-unstyled" id="homeSubmenu">
                      <li><a href="index.htm">Basic Api</a></li>
                       <li><a href="pro_api.htm">Pro Api</a></li>
                       <li><a href="api_plus.htm">Api Plus</a></li>
                      <li><a href="send_information_sms.htm">Bilgi Sms Gönderim Servisi</a></li>
                    </ul>
                </li>
                 <li>
                    <a href="#subscriber" data-toggle="collapse" aria-expanded="false">Abonelik Servisleri</a>
                    <ul class="collapse list-unstyled" id="subscriber">
                      <li><a href="subscriber_select.htm">Abonelik Listele</a></li>
                      <li><a href="subscriber_detail.htm">Abonelik Detay</a></li>
                      <li><a href="subscriber_deactive.htm">Abonelik İptal Etme</a></li>
                       <li><a href="subscriber_change_price.htm">Abonelik Ücretini Güncelleme</a></li>
                       
                    </ul>
                </li>
                 <li>
                     <a href="#paymentForm" data-toggle="collapse" aria-expanded="false">Ödeme Formu</a>
                    <ul class="collapse list-unstyled" id="paymentForm">
                      <li><a href="ccroxy_sale3d.htm">3D Secure İle Ödeme Formu</a></li>
                       <li><a href="ccproxy_sale.htm">3D Secure Olmadan Ödeme Formu</a></li>
                       
                    </ul>
                </li>
                 <li>
                     <a href="#cammonPaymentForm" data-toggle="collapse" aria-expanded="false">Ortak Ödeme Formu</a>
                    <ul class="collapse list-unstyled" id="cammonPaymentForm">
                      <li><a href="wdticket_sale3durl.htm">3D Secure İle Ödeme Formu</a></li>
                       <li><a href="wdticket_sale.htm">3D Secure olmadan Ödeme Formu</a></li>
                       
                    </ul>
                </li>
                 <li>
                    <a href="#marketPlace" data-toggle="collapse" aria-expanded="false">Mağaza Servisleri</a>
                    <ul class="collapse list-unstyled" id="marketPlace">
                      <li><a href="marketplace_add_subpartner.htm">Mağaza Oluştur (Belge İle Doğrulama)</a></li>
                      <li><a href="marketplace_update_subpartner.htm">Mağaza Güncelle (Belge İle Doğrulama)</a></li>
                      <li><a href="marketplace_add_subpartner_online_verify.htm">Mağaza Oluştur (Online Doğrulama)</a></li>
                      <li><a href="marketplace_update_subpartner_online_verify.htm">Mağaza Güncelle (Online Doğrulama)</a></li>
                      <li><a href="marketplace_deactive_subpartner.htm">Mağaza Sil</a></li>
                      <li><a href="marketplace_sale_3dsecure.htm">3D Secure ile Ödeme</a></li>
                      <li><a href="marketplace_mpsale.htm">3D Secure Olmadan Ödeme</a></li>
                      <li><a href="marketplace_wdticketmpsale3dseure.htm">Wirecard ortak ödeme sayfası</a></li>
                      <li><a href="marketplace_release_payment.htm">Ödeme Onay Servisi</a></li>
                    </ul>
                </li>
                <li>
                     <a href="#ccTokenize" data-toggle="collapse" aria-expanded="false">Kart Saklama</a>
                    <ul class="collapse list-unstyled" id="ccTokenize">
                      <li><a href="tokenize_ccurl.htm">Url Yöntemi ile kart saklama</a></li>
                       <li><a href="tokenizecc.htm">Direk Kart Sakla</a></li>
                       
                    </ul>
                </li>
                 <li>
                     <a href="#transactionQueryForm" data-toggle="collapse" aria-expanded="false">İşlem Sorgulama</a>
                    <ul class="collapse list-unstyled" id="transactionQueryForm">
                      <li><a href="transactionquery_order.htm">Sipariş Numarası ile İşlem Sorgulama</a></li>
                       <li><a href="transactionquery_mpay.htm">MPAY ile İşlem Sorgulama</a></li>
                       
                    </ul>
                </li>
            </ul>  
        </nav>
     <div id="content">
            <nav class="navbar navbar-default">
                <div class="container-fluid">

                    <div class="navbar-header">
                        <button type="button" id="sidebarCollapse" class="btn btn-info navbar-btn">
                            <i class="glyphicon glyphicon-align-left"></i>
                        </button>
                    </div>
                </div>
            </nav>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
