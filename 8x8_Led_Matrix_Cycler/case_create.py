def one_hot(num, a):
    if num == 0:
        return "XXXXXXX" + str(a)
    elif num == 1:
        return "XXXXXX" + str(a) + "X"
    elif num == 2:
        return "XXXXX" + str(a) + "XX"
    elif num == 3:
        return "XXXX" + str(a) + "XXX"
    elif num == 4:
        return "XXX" + str(a) + "XXXX"
    elif num == 5:
        return "XX" + str(a) + "XXXXX"
    elif num == 6:
        return "X" + str(a) + "XXXXXX"
    elif num == 7:
        return str(a) + "XXXXXXX"
    # for full in range(64):


x = 0
y = 0
for i in range(64):
    # print("led_num[" + str(i) + "] : begin")
    # print("     col = 8'b" + one_hot(x, 0) + ";")
    # print("     row = 8'b" + one_hot(y, 1) + ";")
    # print(" end")
    # print()
    print("if(led_num[" + str(i) + "]) begin")
    print("    if(rst_others)begin")
    print("        col = 8'hFF;")
    print("        row = 8'h00;")
    print("    end")
    print("    col[" + str(x) + "] = 1'b0;")
    print("    row[" + str(y) + "] = 1'b1;")
    print("end\n")
    x += 1
    if x == 8:
        y += 1
        x = 0


# if(led_num[i]) begin
#     if(rst_others)begin
#         col = 8'hFF;
#         row = 8'h00;
#     end
#         col[x] = 1'b0;
#         row[y] = 1'b1;
# end
