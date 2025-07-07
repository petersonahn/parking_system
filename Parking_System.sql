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

-- 입차 : 임의로 발생시킨 난수 car_num을 cars 테이블 데이터에 insert
-- 출차 : cars 테이블 out_time 추가, 요금 정산 후 해당 row 데이터 delete

-- 입차 -> 임의의 car_num 입력 후 주차 할 parking_id 선택

-- 차량 위치 조회 -> parking 테이블에서 입력한 car_num 조회하여 해당 행의 parking_id 반환

-- 출차 -> 출차 할 차량의 car_num 입력 후 users 테이블에서 해당 차량 번호 조회
--        정보가 존재하면 회원권에 해당하는 방식(미정)으로 요금 납부,
--        정보가 존재하지 않으면 cars 테이블에서 해당 car_num 조회하여 해당 행에서
--        out_time 데이터 update 후 요금 계산(out_time - in_time * ...)하여
--        요금 납부 후 출차, cars 테이블에서 입력한 car_num에 해당하는 데이터 delete

-- 관리 -> 

-- cars 테이블에서 전체 count 혹은 parking 테이블에서 car_num이 null인 행만 count
-- └> (전체 주차 자리 - count 값) => 남은 주차 자리 수,
--     주차 가능 구역 -> parking 테이블에서 car_num이 null인 행의 parking_id

-- EX)
-- parking 테이블 사전 구성
insert into parking values('A01', '');
insert into parking values('A02', '');
commit;

-- 입차
insert into cars values('12가1234', sysdate, '');
insert into cars values('12가1111', sysdate, '');
update parking set car_num = '12가1234' where parking_id = 'A02';
update parking set car_num = '12가1111' where parking_id = 'A03';
commit;

-- 출차
update cars set out_time = sysdate where car_num = '12가1234';
delete from cars where car_num = '12가1234';
commit;

