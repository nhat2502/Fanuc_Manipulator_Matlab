clc; clear; close all;
disp('--- FANUC M-20iA/35M FORWARD KINEMATICS ---');

% 1. Khai báo biến khớp (symbolic variables)
syms q1 q2 q3 q4 q5 q6 real

% Biến pi tượng trưng để triệt tiêu lượng giác chính xác
pi_sym = sym(pi); 

% 2. Bảng tham số D-H Standard Fanuc M-20iA/35M
% Cột: [a, alpha, d, theta]
DH = [150,   pi_sym/2,  525,  q1;
      790,   0,         0,    q2;
      150,   pi_sym/2,  0,    q3;
      0,    -pi_sym/2,  860,  q4];

% 3. Gọi hàm tính động học thuận
[T_total, A_matrices] = ForwardKinematic(DH);

% 4. In kết quả từng ma trận A_i (từ hệ i-1 sang i)
fprintf('\n--- CÁC MA TRẬN BIẾN ĐỔI (A_i) ---\n');
for i = 1:length(A_matrices)
    fprintf('A_%d (Frame %d to %d) = \n', i, i-1, i);
    disp(A_matrices{i}); 
end

% 5. Kết quả cuối cùng (T_0_6)
disp('--- MA TRẬN THUẦN NHẤT TỔNG (T_0_6) ---');
% Lưu ý: Ma trận này dạng ký hiệu sẽ rất dài
disp(T_total);

disp('--- VỊ TRÍ KHÂU CUỐI (Px, Py, Pz) ---');
P = T_total(1:3, 4);
disp(P);

disp('--- CHUẨN BỊ CHO JACOBIAN ---');
disp('Bạn có thể dùng lệnh sau để tính J11 (Jacobian vị trí):');
disp('J_pos = jacobian(P, [q1 q2 q3 q4 q5 q6]);');

%Function definition
function [T, A_n] = ForwardKinematic(DH)
    n = size(DH,1);
    T = eye(4);
    A_n = cell(1,n); % Cell array lưu các ma trận A
    
    for i = 1:n
        a     = DH(i,1);
        alpha = DH(i,2);
        d     = DH(i,3);
        theta = DH(i,4);
        
        % Công thức DH Standard
        A = [cos(theta)  -sin(theta)*cos(alpha)   sin(theta)*sin(alpha)   a*cos(theta);
             sin(theta)   cos(theta)*cos(alpha)  -cos(theta)*sin(alpha)   a*sin(theta);
             0            sin(alpha)              cos(alpha)              d;
             0            0                       0                       1];
             
        % Đơn giản hóa biểu thức ngay lập tức để tránh công thức bị phình to
        A = simplify(A);
        
        A_n{i} = A;
        T = T * A;
    end
    % Đơn giản hóa ma trận tổng cuối cùng
    T = simplify(T);
end
