create table cars(
    car_num varchar2(20) primary key,
    in_time date not null,
    out_time date
);

create table parking(
    parking_id varchar2(10) primary key,
    car_num varchar2(20),
    constraint car_num_fk foreign key(car_num) 
        REFERENCES cars(car_num) on delete set null
);

create table users(
    user_id varchar2(20) primary key,
    user_car_num varchar2(20) not null,
    user_name varchar2(20) not null,
    user_phone varchar2(20) not null
);

create table managers(
    manager_id varchar2(20) primary key,
    manager_pwd varchar2(20) not null
);

create table parking_record(
    parking_rec_num number(10) primary key, 
    car_num varchar2(20) not null,
    in_time date not null,
    out_time date,
    user_id varchar2(20)
);

CREATE TABLE parking_fee (
    car_num VARCHAR2(20) NOT NULL,
    in_time DATE NOT NULL,
    out_time DATE,
    fee_amount NUMBER,
    CONSTRAINT pk_parking_fee PRIMARY KEY (car_num, in_time),
    CONSTRAINT fk_parking_fee_cars FOREIGN KEY (car_num) REFERENCES cars(car_num)
    -- 기본키: car_num + in_time → 같은 차량도 입차 시간이 다르면 중복 없이 여러 번 주차 가능. --
    -- 외래키: car_num → cars 테이블에 등록된 차량만 저장 가능. --
);



---- PARKING 테이블 데이터 추가

-- A section
INSERT INTO parking VALUES('A01', '');
INSERT INTO parking VALUES('A02', '');
INSERT INTO parking VALUES('A03', '');
INSERT INTO parking VALUES('A04', '');
INSERT INTO parking VALUES('A05', '');
INSERT INTO parking VALUES('A06', '');
INSERT INTO parking VALUES('A07', '');
INSERT INTO parking VALUES('A08', '');
INSERT INTO parking VALUES('A09', '');
INSERT INTO parking VALUES('A10', '');
INSERT INTO parking VALUES('A11', '');
INSERT INTO parking VALUES('A12', '');
INSERT INTO parking VALUES('A13', '');
INSERT INTO parking VALUES('A14', '');
INSERT INTO parking VALUES('A15', '');
INSERT INTO parking VALUES('A16', '');
INSERT INTO parking VALUES('A17', '');
INSERT INTO parking VALUES('A18', '');
INSERT INTO parking VALUES('A19', '');
INSERT INTO parking VALUES('A20', '');
INSERT INTO parking VALUES('A21', '');
INSERT INTO parking VALUES('A22', '');
INSERT INTO parking VALUES('A23', '');
INSERT INTO parking VALUES('A24', '');
INSERT INTO parking VALUES('A25', '');
INSERT INTO parking VALUES('A26', '');
INSERT INTO parking VALUES('A27', '');
INSERT INTO parking VALUES('A28', '');
INSERT INTO parking VALUES('A29', '');
INSERT INTO parking VALUES('A30', '');
INSERT INTO parking VALUES('A31', '');
INSERT INTO parking VALUES('A32', '');
INSERT INTO parking VALUES('A33', '');
INSERT INTO parking VALUES('A34', '');
INSERT INTO parking VALUES('A35', '');
INSERT INTO parking VALUES('A36', '');
INSERT INTO parking VALUES('A37', '');
INSERT INTO parking VALUES('A38', '');
INSERT INTO parking VALUES('A39', '');
INSERT INTO parking VALUES('A40', '');
INSERT INTO parking VALUES('A41', '');
INSERT INTO parking VALUES('A42', '');
INSERT INTO parking VALUES('A43', '');
INSERT INTO parking VALUES('A44', '');
INSERT INTO parking VALUES('A45', '');
INSERT INTO parking VALUES('A46', '');
INSERT INTO parking VALUES('A47', '');
INSERT INTO parking VALUES('A48', '');
INSERT INTO parking VALUES('A49', '');
INSERT INTO parking VALUES('A50', '');

-- B section
INSERT INTO parking VALUES('B01', '');
INSERT INTO parking VALUES('B02', '');
INSERT INTO parking VALUES('B03', '');
INSERT INTO parking VALUES('B04', '');
INSERT INTO parking VALUES('B05', '');
INSERT INTO parking VALUES('B06', '');
INSERT INTO parking VALUES('B07', '');
INSERT INTO parking VALUES('B08', '');
INSERT INTO parking VALUES('B09', '');
INSERT INTO parking VALUES('B10', '');
INSERT INTO parking VALUES('B11', '');
INSERT INTO parking VALUES('B12', '');
INSERT INTO parking VALUES('B13', '');
INSERT INTO parking VALUES('B14', '');
INSERT INTO parking VALUES('B15', '');
INSERT INTO parking VALUES('B16', '');
INSERT INTO parking VALUES('B17', '');
INSERT INTO parking VALUES('B18', '');
INSERT INTO parking VALUES('B19', '');
INSERT INTO parking VALUES('B20', '');
INSERT INTO parking VALUES('B21', '');
INSERT INTO parking VALUES('B22', '');
INSERT INTO parking VALUES('B23', '');
INSERT INTO parking VALUES('B24', '');
INSERT INTO parking VALUES('B25', '');
INSERT INTO parking VALUES('B26', '');
INSERT INTO parking VALUES('B27', '');
INSERT INTO parking VALUES('B28', '');
INSERT INTO parking VALUES('B29', '');
INSERT INTO parking VALUES('B30', '');
INSERT INTO parking VALUES('B31', '');
INSERT INTO parking VALUES('B32', '');
INSERT INTO parking VALUES('B33', '');
INSERT INTO parking VALUES('B34', '');
INSERT INTO parking VALUES('B35', '');
INSERT INTO parking VALUES('B36', '');
INSERT INTO parking VALUES('B37', '');
INSERT INTO parking VALUES('B38', '');
INSERT INTO parking VALUES('B39', '');
INSERT INTO parking VALUES('B40', '');
INSERT INTO parking VALUES('B41', '');
INSERT INTO parking VALUES('B42', '');
INSERT INTO parking VALUES('B43', '');
INSERT INTO parking VALUES('B44', '');
INSERT INTO parking VALUES('B45', '');
INSERT INTO parking VALUES('B46', '');
INSERT INTO parking VALUES('B47', '');
INSERT INTO parking VALUES('B48', '');
INSERT INTO parking VALUES('B49', '');
INSERT INTO parking VALUES('B50', '');

commit;
