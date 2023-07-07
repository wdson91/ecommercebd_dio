CREATE DATABASE ecommerce;


--criar tebela cliente
create table client (
        idclient  serial primary key,
        Fname varchar(10),
        Minit char(2),
        Lname varchar(20),
        CPF char(11) not null,
        Address varchar(30),
        constraint unique_cpf_client unique (CPF)
    );

--criar tabela produto
CREATE TABLE product (
    idProduct serial primary key,
    Pname varchar(10) not null,
    classification_kids boolean default false,
    category varchar(20) not null,
    avaliacao float default 0,
    size varchar(10),
    constraint unique_idproduct unique (idProduct),
    constraint check_category check (category in ('Eletronico', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Móveis'))
);

-- criar tabela pagamentos
create table payments(
        idclient int,
        idPayment int,
        typePayment varchar not null,
        limitAvallable float,
        primary key(idclient, idpayment),
        constraint check_typePayment check (typePayment in (  'Boleto','Cartão','Dois cartoes'))
    ); 

--criar tabela pedido
CREATE TABLE orders (
    idorder serial primary key,
    idOrderClient int,
    orderStatus varchar(20) not null,
    orderDescription varchar(255),
    sendValue float default 10,
    paymentCash bool default false,
    constraint fk_orders_client foreign key (idOrderClient) references client (idclient),
    constraint check_orderStatus check (orderStatus in ( 'Cancelado',' Confirmado ', ' En processamento'))
);

CREATE TABLE productStorage (
    idProdStorage serial primary key,
    storageLocation varchar(255),
    quantity int default 0
);

CREATE TABLE supplier (
    idsupplier serial primary key,
    SocialName varchar(255) not null,
    CNPJ char(15) not null,
    contact char(11) not null,
    constraint unique_supplier unique (CNPJ)
);

CREATE TABLE seller (
    idseller serial primary key,
    SocialName varchar(255) not null,
    AbstName varchar(255),
    CNPT char(15),
    CPF char(9),
    location varchar(255),
    contact char(11) not null,
    constraint unique_cnpj_seller unique (CNPT),
    constraint unique_cpf_seller unique (CPF)
);

CREATE TABLE productSeller (
    idPseller int,
    idProduct int,
    prodQuantity int default 1,
    primary key (idPseller, idProduct),
    constraint fk_product_seller foreign key (idPseller) references seller (idseller),
    constraint fk_product_product foreign key (idProduct) references product (idProduct)
);

CREATE TABLE productorder (
    idPOproduct int,
    idPOorder int,
    poQuantity int default 1,
    poStatus varchar(20) default 'Disponível',
    primary key (idPOproduct, idPOorder),
    constraint fk_productorder_product foreign key (idPOproduct) references product (idProduct),
    constraint fk_productorder_order foreign key (idPOorder) references orders (idorder),
    constraint check_poStatus check (poStatus in ( 'Disponível',' Sem estoque'))
    
);


create table storageLocation(
    idLproduct int,
    idLstorage int,
    location varchar(255) not null,
    primary key (idLproduct, idLstorage),
    constraint fk_storage_location_product foreign key (idLproduct) references product(idProduct),
    constraint fk_storage_location_storage foreign key (idLstorage) references productstorage(idProdStorage)

);