
-- ���������� �۾�
-- royal ������ �߰�
INSERT INTO royal VALUES (
    1,
    '�溹��'
);

INSERT INTO royal VALUES (
    2,
    'â����'
);

INSERT INTO royal VALUES (
    3,
    'â���'
);

INSERT INTO royal VALUES (
    4,
    '������'
);

INSERT INTO royal VALUES (
    5,
    '����'
);


--------------------------------------------------------------------------------
-- �溹�� �ؼ� �߰�
INSERT INTO event_list(
    event_id,
    royal_id,
    event_type,
    event_name,
    event_location,
    event_rounds,
    start_date,
    end_date,
    reservable
    ) VALUES (
    event_list_id_seq.NEXTVAL,
    (
        SELECT DISTINCT
            r.royal_id
        FROM
            royal r
            LEFT JOIN event_list e ON r.royal_id = e.royal_id
        WHERE
            r.royal_name = '�溹��'
    ),
    '�ؼ�',
    '�溹�� �ؼ�',
    '�溹��',
    2,
    '2024-01-01',
    '2024-12-31',
    'Y'
);

INSERT INTO event_round (
    round_id,
    event_id,
    round_num,
    round_time,
    round_capacity
) VALUES (
    event_round_id_seq.NEXTVAL,
    ( SELECT DISTINCT event_id FROM event_list WHERE event_name='�溹�� �ؼ�'),
    1,
    '09:00',
    30
);
INSERT INTO event_round (
    round_id,
    event_id,
    round_num,
    round_time,
    round_capacity
) VALUES (
    event_round_id_seq.NEXTVAL,
    ( SELECT DISTINCT event_id FROM event_list WHERE event_name='�溹�� �ؼ�'),
    2,
    '10:00',
    30
);

--------------------------------------------------------------------------------
-- ������ �ؼ� �߰�
INSERT INTO event_list(
    event_id,
    royal_id,
    event_type,
    event_name,
    event_location,
    event_rounds,
    start_date,
    end_date,
    reservable
    ) VALUES (
    event_list_id_seq.NEXTVAL,
    (
        SELECT DISTINCT
            r.royal_id
        FROM
            royal r
            LEFT JOIN event_list e ON r.royal_id = e.royal_id
        WHERE
            r.royal_name = '������'
    ),
    '�ؼ�',
    '������ �ؼ�',
    '������',
    2,
    '2024-01-01',
    '2024-12-31',
    'Y'
);

INSERT INTO event_round (
    round_id,
    event_id,
    round_num,
    round_time,
    round_capacity
) VALUES (
    event_round_id_seq.NEXTVAL,
    ( SELECT DISTINCT event_id FROM event_list WHERE event_name='������ �ؼ�'),
    1,
    '09:00',
    30
);
INSERT INTO event_round (
    round_id,
    event_id,
    round_num,
    round_time,
    round_capacity
) VALUES (
    event_round_id_seq.NEXTVAL,
    ( SELECT DISTINCT event_id FROM event_list WHERE event_name='������ �ؼ�'),
    2,
    '10:00',
    30
);

--------------------------------------------------------------------------------
-- â��� �ؼ� �߰�
INSERT INTO event_list(
    event_id,
    royal_id,
    event_type,
    event_name,
    event_location,
    event_rounds,
    start_date,
    end_date,
    reservable
    ) VALUES (
    event_list_id_seq.NEXTVAL,
    (
        SELECT DISTINCT
            r.royal_id
        FROM
            royal r
            LEFT JOIN event_list e ON r.royal_id = e.royal_id
        WHERE
            r.royal_name = 'â���'
    ),
    '�ؼ�',
    'â��� �ؼ�',
    'â���',
    2,
    '2024-01-01',
    '2024-12-31',
    'Y'
);

INSERT INTO event_round (
    round_id,
    event_id,
    round_num,
    round_time,
    round_capacity
) VALUES (
    event_round_id_seq.NEXTVAL,
    ( SELECT DISTINCT event_id FROM event_list WHERE event_name='â��� �ؼ�'),
    1,
    '09:00',
    30
);
INSERT INTO event_round (
    round_id,
    event_id,
    round_num,
    round_time,
    round_capacity
) VALUES (
    event_round_id_seq.NEXTVAL,
    ( SELECT DISTINCT event_id FROM event_list WHERE event_name='â��� �ؼ�'),
    2,
    '10:00',
    30
);

--------------------------------------------------------------------------------
-- â���� �ؼ� �߰�
INSERT INTO event_list(
    event_id,
    royal_id,
    event_type,
    event_name,
    event_location,
    event_rounds,
    start_date,
    end_date,
    reservable
    ) VALUES (
    event_list_id_seq.NEXTVAL,
    (
        SELECT DISTINCT
            r.royal_id
        FROM
            royal r
            LEFT JOIN event_list e ON r.royal_id = e.royal_id
        WHERE
            r.royal_name = 'â����'
    ),
    '�ؼ�',
    'â���� �ؼ�',
    'â����',
    2,
    '2024-01-01',
    '2024-12-31',
    'Y'
);

INSERT INTO event_round (
    round_id,
    event_id,
    round_num,
    round_time,
    round_capacity
) VALUES (
    event_round_id_seq.NEXTVAL,
    ( SELECT DISTINCT event_id FROM event_list WHERE event_name='â���� �ؼ�'),
    1,
    '09:00',
    30
);
INSERT INTO event_round (
    round_id,
    event_id,
    round_num,
    round_time,
    round_capacity
) VALUES (
    event_round_id_seq.NEXTVAL,
    ( SELECT DISTINCT event_id FROM event_list WHERE event_name='â���� �ؼ�'),
    2,
    '10:00',
    30
);

--------------------------------------------------------------------------------
-- ���� �ؼ� �߰�
INSERT INTO event_list(
    event_id,
    royal_id,
    event_type,
    event_name,
    event_location,
    event_rounds,
    start_date,
    end_date,
    reservable
    ) VALUES (
    event_list_id_seq.NEXTVAL,
    (
        SELECT DISTINCT
            r.royal_id
        FROM
            royal r
            LEFT JOIN event_list e ON r.royal_id = e.royal_id
        WHERE
            r.royal_name = '����'
    ),
    '�ؼ�',
    '���� �ؼ�',
    '����',
    2,
    '2024-01-01',
    '2024-12-31',
    'Y'
);

INSERT INTO event_round (
    round_id,
    event_id,
    round_num,
    round_time,
    round_capacity
) VALUES (
    event_round_id_seq.NEXTVAL,
    ( SELECT DISTINCT event_id FROM event_list WHERE event_name='���� �ؼ�'),
    1,
    '09:00',
    30
);
INSERT INTO event_round (
    round_id,
    event_id,
    round_num,
    round_time,
    round_capacity
) VALUES (
    event_round_id_seq.NEXTVAL,
    ( SELECT DISTINCT event_id FROM event_list WHERE event_name='���� �ؼ�'),
    2,
    '10:00',
    30
);


--------------------------------------------------------------------------------
-- notice test ������ �߰�
    INSERT INTO notice (
        notice_id,
        royal_id,
        notice_title,
        notice_content
    ) VALUES (
        notice_id_seq.NEXTVAL,
        (SELECT royal_id FROM royal WHERE royal_name='â����'),
        '2024�� �� ���ޱⰣ â���� �ؼ�� �ȳ�(2/9~2/12)',
        '2024�� �� ���ޱⰣ ���ᰳ�� (â�����Ŀ� ����)�� �ǽ��Ͽ��� ������ �����Ͻñ� �ٶ��ϴ�.



�� �� �� : 2024.2. 9.(��) ~ 2. 12.(��) / 4�ϰ�



�� �ؼ� � : �ñ� ���� ���� �ȳ��ؼ��� â���� ���̺���(�ȳ�����,������) �̿



*�Ŀ� ���� �ȳ��ؼ� ����(�Ŀ����� ��������)



�� ���� �����޹��� ������(2.12)�� ��� ���� ������ ���� ������(2.12) �����ϸ�, �̿� ���� �޹����� ȭ����(2.13)�� ����Ǿ� ��˴ϴ�.



(������ �Ŀ� �߱��� �� �Ϻ��� �ؼ��� �������� �ʽ��ϴ�.)'
    );


--------------------------------------------------------------------------------
-- notice test ������ �߰�
    INSERT INTO notice (
        notice_id,
        royal_id,
        notice_title,
        notice_content
    ) VALUES (
        notice_id_seq.NEXTVAL,
        (SELECT royal_id FROM royal WHERE royal_name='������'),
        '������ �� �ӽ� ��� �˸�(1.17.)',
        '�ȳ��ϼ���, �����ð������Դϴ�.

����� ������� ���� ��� ���� ������ ���Ͽ� ������ <������ ��>�� �ӽ� ����մϴ�. 

���� ��Ź�帳�ϴ�. 



- ����: ������ �� �ӽ� ���

- �Ⱓ: 2024.1.17.(��) 

- ����: ����� ������� ���� ��� ���� ����

* ���� ��Ȳ�� ���� ���� �簳 ���θ� ������ �����Դϴ�.'
    );

--------------------------------------------------------------------------------
-- FAQ �߰�
INSERT INTO faq (
    faq_id,
    royal_id,
    faq_title,
    faq_result
) VALUES (
    faq_id_seq.nextval,
    (SELECT royal_id FROM royal WHERE royal_name='�溹��'),
    '�溹���� ����� �� �󸶳� �ɷ�����?',
    '�ҵ�~ �ҵ�~ ���� �ӱݴ��� ���ο� ���� ������ ����� ���� ���� ������ ���� ���� ����Ե��� ��ô� ���������� ���� �սǰ����� �������� ���� ���ϵ��� �ӹ����� ���ñȡ��� ���� ���̾����ϴ�. �ñ��� ���µ� �ɸ� �ð��� 10���� ���������ϴ�. �ñ� ���� ������ ���� ���� �� ���Ǵ� ���縦 �Ͽ��� ���� 3��(1395) 12������ ���縦 �����Ͽ� ������ 9���� �ϼ��Ͽ����ϴ�. �ñ� �ȿ��� �������� �ǳ��ϴ� ��, �հ� �պ񲲼� ��� ��, ���ϵ��� ����ؼ� ���ϴ� ��, �ñȴ���� ���Թ� ���� �־��� �ñ��� �̸��� ���溹�á��̶�� ������ϴ�.'
);


INSERT INTO faq (
    faq_id,
    royal_id,
    faq_title,
    faq_result
) VALUES (
    faq_id_seq.nextval,
    (SELECT royal_id FROM royal WHERE royal_name='â����'),
    'â�������� �����ؼ� â��ð� ������ �� �� �ֳ���?',
    'â����, â���, ������ ��ġ�� ���� ������ ������ ���Թ��� ���������� �ֽ��ϴ�.
������, â���ð� â����� ���� ���� �̾��ִ� ��(�Ծ繮)�� �����Ƿ� �߰� ��ǥ�� �Ͻø�, ���� ������ �����մϴ�.

������ â����, â��ð� ����Ǵ� ���� �����ϴ�.

-���Ṯ(�Ծ繮)�� ��ǥ�ҿ��� ������� �����ϼž� �ϸ�, �������� �Ұ��մϴ�.

-���Ṯ(�Ծ繮) � ����ð��� ������ �����Ͻñ� �ٶ��ϴ�.*�Ծ繮 � ����ð��� â���� ����(��ȭ��) ���� ���� �ð��� �����մϴ�.

-���Ṯ(�Ծ繮)�� â������ ���������� ��ġ�� �ֱ� ������, â��ÿ��� â���� �Ŀ� ������ �ٷ� �����Ͻ� �� �����ϴ�.

��2022�� 7���� ����� ���� �ͳ� ����� â��ð� ������ �մ� ���ձ��� ��å �뵵�� �������θ� �̿��Ͻ� �� ������, ���� �� ���ձ��� ���� â��ð� ������ �����Ͻ� �� �����ϴ�.'
);

INSERT INTO faq (
    faq_id,
    royal_id,
    faq_title,
    faq_result
) VALUES (
    faq_id_seq.nextval,
    (SELECT royal_id FROM royal WHERE royal_name='������'),
    '���ѹ� ��Ī�� ���Ͽ�',
    '���ѹ��� ���� ��Ī�� ��ȹ�(����ڦ)���� 1904��(���� 8) ���� ȭ��� ���ظ� ������ �ʾҽ��ϴ�.
���� �߰��� ���� �������Ǵ� 1906��(���� 10) 4�� 12�� ��ȹ��� ������ �ÿ�(��)�ϰ� �� ��Ī�� ���ѹ�(����ڦ)���� ���ƽ��ϴ�. �̾� 4�� 24�Ͽ��� ��(߾��)�� �ϰ� ����(����)�� �ɾ����ϴ�.
������(����)���� �Ѿ��� â�������١��� ���Դϴ�. <���ѹ��󷮹�(����ڦ߾����)>�� ���� ��Ȳ�ϰ� �������� õ���Ͽ��� �ÿ��� �¾����Ƿ� ������ ���� â���� ���̰�, �Ѿ��� �︸�� �̾ ������ �ڸ��Ͽ����� �� �̸����� Ư���� �Ǵ�.���� ���� �ֽ��ϴ�. �Ѿ��� ������ �Ͽ� ���� �¾ ���������� ������ â���϶�� ������ ���� ���Դϴ�.'
);

INSERT INTO faq (
    faq_id,
    royal_id,
    faq_title,
    faq_result
) VALUES (
    faq_id_seq.nextval,
    (SELECT royal_id FROM royal WHERE royal_name='â���'),
    'â��ð� â������ ��� �ٸ�����?',
    '1395��(����4) �溹���� â�ǵǾ��� 1405��(����5) â������ â�ǵǾ� ������ �溹���� �̱������� ������ �Ͽ����ϴ�. â����� 1484��(����15) �������, �ȼ�����, �������� �� �� ��� ��ñ� ���� �������� â�ǵǾ� �ʱ⿡�� ��������� �� Ȱ�뵵�� ���ҽ��ϴ�. �׷��� �����ֶ� ���� �溹���� �߰ǵ��� �ʰ� â���ð� â��ø� ��ǵǾ� â������ ������ ������ �ϰ� �Ǹ鼭 �������ִ� â����� �ս��� ��Ȱ�������� �� Ȱ��󵵰� ���������ϴ�.'
);


commit;

-------------------------------------------------------------------------------