### 1. 기본 문법

##### ⑤ SELECT	[ALL|DISTINCT] 출력하려는 열 (* : 모든 열) 	[AS]	별칭

	- ALL
	
	- DISTINCT : 중복 제거. 뒤에 열 이름을 계속 나열하면 모두 DISTICNT가 적용된다
	- AS : 열 이름을 임시로 변경하여 출력. 별칭에 공백, 특수문자, 대소문자 등을 사용하려면 큰따옴표("")로 묶어서 사용

##### ① FROM	테이블

##### ② WHERE	검색조건

##### ③ GROUP BY	속성이름 [DESC|ASC]

	- 정렬을 원하는 열 이름을 순서대로 지정
	- 내림차순으로 정렬하려면 열 이름 다음에 **DESC**

##### ④ HAVING	검색조건

##### ⑥ ORDER BY	열 이름, 열 이름 DESC(내림차순) ;

*코드마지막에는 항상 ;*

*where은 grouping 전 / having은 grouping 후*



### 2. WHERE 조건절

| 술어     | 연산자               | 사용 예                                           |
| -------- | -------------------- | ------------------------------------------------- |
| 비교     | =, <>, <, <=         | price < 20000                                     |
| 범위     | BETWEEN              | price BETWEEN 10000 AND 20000                     |
| 집합     | IN, NOT IN           | price IN (10000, 20000, 30000)                    |
| 패턴     | LIKE                 | bookname LIKE '축구의 역사'                       |
| NULL     | IS NULL, IS NOT NULL | price IS NULL                                     |
| 복합조건 | AND, OR, NOT         | (price < 20000) AND (bookname LIKE '축구의 역사') |



#### 비교 연산자

| 연산자   | 의미             |
| -------- | ---------------- |
| =        | 같다             |
| <> or != | 같지 않다        |
| >        | 보다 크다        |
| >=       | 보다 크거나 같다 |
| <        | 보다 작다        |
| <=       | 보다 작거나 같다 |



#### SQL 연산자

##### BETWEEN a AND b : a와 b 사이에 값이 있다 (a,b값 포함)

##### IN (list) : list 중 어느 값이라도 일치한다

​	= 연산자와 유사하지만 IN 연산자는 데이터 값을 여러개로 지정할 수 있다

```sql
SELECT *
FROM students
WHERE age IN (22, 24, 25);
```

##### LIKE '비교 문자' : 비교 문자와 형태가 일치한다 (%, _ 사용)

​	% : 모든 문자	/	_ : 한 글자

| 와일드 문자 | 의미                        | 사용 예                                        |
| ----------- | --------------------------- | ---------------------------------------------- |
| +           | 문자열을 연결               | '골프' + '바이블' : '골프 바이블'              |
| %           | 0개 이상의 문자열과 일치    | '%축구%' : 축구를 포함하는 문자열              |
| []          | 1개의 문자와 일치           | '[0-5]%' : 0-5 사이 숫자로 시작하는 문자열     |
| [^]         | 1개의 문자와 불일치         | 0-5 사이 숫자로 시작하지 않는 문자열           |
| _           | 특정 위치의 1개 문자와 일치 | '_구%' : 두 번째 위치에 '구'가 들어가는 문자열 |



##### IS NULL : null 값을 갖는다

​	null : 지정되지 않은 값, 0 이나 공백과는 다름



#### 논리 연산자 : 조건 논리를 계속 연결

| 연산자 | 의미                             |
| ------ | -------------------------------- |
| AND    | 앞뒤 조건을 동시에 만족해야 TRUE |
| OR     | 앞이나 뒤 하나만 TRUE어도 TRUE   |
| NOT    | 뒤의 조건에 대해 반대 결과 반환  |

salary가 4000을 초과하면서(AND), job_id가 IT_PROG거나(OR) FI_ACCOUNT인 경우

```sql
SELECT *
FROM employess
WHERE salary > 4000
AND job_id = 'IT_PROG'
OR job_id = 'FI_ACCOUNT';
```



### 3. GROUP BY

집계를 하기 위해서는 GROUP BY 문을 사용하고 구체적인 집계 내용은 집계 함수를 사용

#### 집계함수

| 집계 함수 | 문법                                 | 사용 예    |
| --------- | ------------------------------------ | ---------- |
| SUM       | SUM([ALL\|DISTINCT] 속성이름)        | SUM(price) |
| AVG       | AVG([ALL\|DISTINCT] 속성이름)        | AVG(price) |
| COUNT     | COUNT([ALL\|DISTINCT] 속성이름 \| *) | COUNT(*)   |
| MAX       | MAX([ALL\|DISTINCT] 속성이름)        | MAX(price) |
| MIN       | MIN([ALL\|DISTINCT] 속성이름)        | MIN(price) |

#### 주의사항

1. GROUP BY로 투플을 그룹으로 묶은 후 SELECT 절에는 GROUP BY에서 사용한 <속성>과 집계 함수만 나올 수 있다.
2. WHERE 절과 HAVING 절이 같이 포함된 SQL 문은 검색조건이 모호해질 수 있다. HAVING절은 반드시 GROUP BY 절과 같이 작성해야하고, WHERE 절보다 뒤에 나와야한다. <검색조건>에는 SUM, AVG, MAX, MIN, COUNT와 같은 집계함수가 와야 한다



### 4. JOIN

: 한 테이블의 행을 다른 테이블의 행에 연결하여 두 개 이상의 테이블을 결합하는 연산

- 두 테이블을 아무런 조건을 주지 않고 SELECT 시키면 관계대수의 카티전 프로젝트 연산

- WHERE 절에 두 테이블의 연결 조건 추가

  *겹치는 열 이름을 표기할 때는 '테이블이름.열이름' 형식으로 정확히 명시*

##### 동등 조인

```
SELECT	<속성들>
FROM	Table1, Table2
WHERE	<조인조건> AND <검색조건>
```

```
SELECT	<속성들>
FROM	Table1 INNER JOIN Table2 ON <조인조건>
WHERE	<검색조건>
```

##### 외부 조인

```
SELECT  <속성들>
FROM    Table1 {LEFT|RIGHT|FULL [OUTER]} JOIN Table2 ON <조인조건>
WHERE   <검색조건>
```

##### 셀프 조인

: 하나의 테이블(자신)을 대상으로 조인하는 것 -> 조인에 참여하는 속성명이 같아지는 문제가 생기므로 테이블 별칭을 사용

```
-- 사원 'BLAKE'가 관리하는 부하사원의 이름과 직급
-- Emp 테이블 : 사원번호(empno), 이름(ename), 직급(job), 직원관리자 사원번호(mgr)
SELECT	staff.ename, staff.job
FROM	Emp staff, Emp manager
WHERE	staff.mgr=manager.empno AND manager.ename LIKE 'BLAKE';
```

