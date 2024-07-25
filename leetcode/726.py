import re
class Solution:
    def countOfAtoms(self, formula: str) -> str:
        # Break brackets
        b_regex = r"\([A-Za-z0-9]*\)\d*"
        while '(' in formula:
            _a = re.findall(b_regex, formula)
            for match in _a:
                # print(match)
                ms = match.split(')')
                # print(ms)
                if len(ms[-1]) >= 1:
                    count = int(ms[-1])
                else:
                    count = 1
                
                op = match.strip(str(count))
                # print(69, op)
                op = op.strip('(')
                # print(70, op)
                op = op.strip(')')
                # print(71, op)
                formula = formula.replace(match, op*count)
                # print(formula)
            
        elem_regex = r"[A-Z][a-z]*[0-9]*"

        finds = re.findall(elem_regex, formula)

        num_regex = r"[0-9]+"
        count_dict = {}
        for find in finds:
            _fa = re.findall(num_regex, find)
            if _fa:
                count = int(_fa[0])
                elem = find.replace(_fa[0], "")
            else:
                count = 1
                elem = find
            if elem in count_dict:
                count_dict[elem] += count
            else:
                count_dict[elem] = count
        op_str = ""
        for key, value in sorted(count_dict.items()):
            op_str += f"{key}{value}" if value > 1 else f"{key}"
        return op_str

print(Solution().countOfAtoms("K4(ON(SO3)2)2"))