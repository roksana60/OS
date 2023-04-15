#!/bin/bash
while true; do
clear
echo &quot;Welcome to My Operating System&quot;
echo &quot;================================&quot;
echo &quot;1. Create file or folder&quot;
echo &quot;2. Rename file&quot;
echo &quot;3. Search file&quot;
echo &quot;4. Delete file or folder&quot;
echo &quot;5. Summation of two numbers&quot;
echo &quot;6. Array sorting&quot;
echo &quot;7. View processes&quot;
echo &quot;8. Kill process&quot;
echo &quot;9. Exit&quot;
read -p &quot;Enter your choice: &quot; choice
case $choice in
1)
read -p &quot;Enter file/folder name: &quot; name
read -p &quot;Enter directory path (default is current directory): &quot;
dir
if [ -z &quot;$dir&quot; ]; then
dir=&quot;.&quot;
fi
read -p &quot;Enter &#39;file&#39; or &#39;folder&#39;: &quot; type
if [ &quot;$type&quot; = &quot;file&quot; ]; then
touch &quot;$dir/$name&quot;
echo &quot;File created successfully!&quot;
elif [ &quot;$type&quot; = &quot;folder&quot; ]; then
mkdir &quot;$dir/$name&quot;
echo &quot;Folder created successfully!&quot;
else
echo &quot;Invalid type. Please enter &#39;file&#39; or &#39;folder&#39;.&quot;
fi
read -p &quot;Press Enter to continue&quot;
;;
2)
read -p &quot;Enter file name: &quot; file
read -p &quot;Enter new name: &quot; new_name
mv &quot;$file&quot; &quot;$new_name&quot;
echo &quot;File renamed successfully!&quot;
read -p &quot;Press Enter to continue&quot;
;;
3)
read -p &quot;Enter file name: &quot; file
if [ -f &quot;$file&quot; ]; then
echo &quot;File found!&quot;

else
echo &quot;File not found.&quot;
fi
read -p &quot;Press Enter to continue&quot;
;;
4)
read -p &quot;Enter file/folder name: &quot; name
read -p &quot;Enter directory path (default is current directory): &quot;
dir
if [ -z &quot;$dir&quot; ]; then
dir=&quot;.&quot;
fi
read -p &quot;Are you sure you want to delete $name? (y/n)&quot; confirm
if [ &quot;$confirm&quot; = &quot;y&quot; ]; then
rm -rf &quot;$dir/$name&quot;
echo &quot;File/folder deleted successfully!&quot;
else
echo &quot;Operation cancelled.&quot;
fi
read -p &quot;Press Enter to continue&quot;
;;
5)
read -p &quot;Enter first number: &quot; num1
read -p &quot;Enter second number: &quot; num2
sum=$((num1+num2))
echo &quot;Sum is: $sum&quot;
read -p &quot;Press Enter to continue&quot;
;;
6)
read -p &quot;Enter array (separated by space): &quot; array
sorted=($(echo &quot;${array[@]}&quot; | tr &#39; &#39; &#39;\n&#39; | sort -n | tr &#39;\n&#39;
&#39; &#39;))
echo &quot;Sorted array: ${sorted[@]}&quot;
read -p &quot;Press Enter to continue&quot;
;;
7)
ps -ef
read -p &quot;Press Enter to continue&quot;
;;
8)
read -p &quot;Enter process ID: &quot; pid
if [[ $pid =~ ^[0-9]+$ ]]; then
if [ &quot;$pid&quot; -eq 1 ]; then
echo &quot;Cannot kill PID 1. This is an essential system process.&quot;
else
kill &quot;$pid&quot; 2&gt;/dev/null
if [ $? -eq 0 ]; then
echo &quot;Process killed successfully!&quot;
else
echo &quot;Failed to kill process. Invalid PID or insufficient
permissions.&quot;
fi

fi
else
echo &quot;Invalid process ID. Please enter a valid number.&quot;
fi
read -p &quot;Press Enter to continue&quot;
;;
9)
echo &quot;Exiting My Operating System&quot;
exit
;;
*)
echo &quot;Invalid choice. Please try again.&quot;
read -p &quot;Press Enter to continue&quot;
;;
esac
done
