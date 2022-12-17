#!/bin/bash
#author: Sajad Kamali

api_key="YOUR_API_KEY"
zone_id="YOUR_ZONE_ID"
domain="example.com"

if [ -z "$api_key" ]
then
    echo "please edit this script and set api key"
    exit 1
fi
if [ -z "$zone_id" ]
then
    echo "please edit this script and set zone id"
    exit 2
fi

a_record (){
    echo "registering ${data[1]}" 
    dnsrecordid=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones/${zone_id}/dns_records?type=A&name=${data[1]}" \
    -H "Authorization: Bearer ${api_key}" \
    -H "Content-Type: application/json" | jq -r '{"result"}[] | .[0] | .id')


    if [[ $dnsrecordid == "null" ]]
    then
        input=$(jq -n --arg name ${data[1]} --arg ip ${data[2]} --argjson ttl ${data[3]} --argjson priority ${data[4]} --argjson proxy ${data[5]} '{"type":"A","name":$name,"content":$ip,"ttl":$ttl,"priority":$priority,"proxied":$proxy}')
        res=$(curl -s -X POST "https://api.cloudflare.com/client/v4/zones/${zone_id}/dns_records" \
        -H "Authorization: Bearer ${api_key}" \
        --data "$input")
        result=$(echo $res | jq -r '.success')
        echo "Success: $result"
        echo "--------------------------------------------------------"
    else
        input=$(jq -n --arg name ${data[1]} --arg ip ${data[2]} --argjson ttl ${data[3]} --argjson priority ${data[4]} --argjson proxy ${data[5]} '{"type":"A","name":$name,"content":$ip,"ttl":$ttl,"priority":$priority,"proxied":$proxy}')
        res=$(curl -s -X PUT "https://api.cloudflare.com/client/v4/zones/$zone_id/dns_records/$dnsrecordid" \
        -H "Authorization: Bearer ${api_key}" \
        --data "$input")
        result=$(echo $res | jq -r '.success')
        echo "Success: $result"
        echo "--------------------------------------------------------"
    fi
}

cname_record (){
    echo "registering ${data[1]}" 
    dnsrecordid=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones/${zone_id}/dns_records?type=CNAME&name=${data[1]}" \
    -H "Authorization: Bearer ${api_key}" \
    -H "Content-Type: application/json" | jq -r '{"result"}[] | .[0] | .id')

    if [[ $dnsrecordid == "null" ]]
    then
        input=$(jq -n --arg name ${data[1]} --arg ip ${data[2]} --argjson ttl ${data[3]} --argjson priority ${data[4]} --argjson proxy ${data[5]} '{"type":"CNAME","name":$name,"content":$ip,"ttl":$ttl,"priority":$priority,"proxied":$proxy}')
        res=$(curl -s -X POST "https://api.cloudflare.com/client/v4/zones/${zone_id}/dns_records" \
        -H "Authorization: Bearer ${api_key}" \
        --data "$input")
        result=$(echo $res | jq -r '.success')
        echo "Success: $result"
        echo "--------------------------------------------------------"
    else
        input=$(jq -n --arg name ${data[1]} --arg ip ${data[2]} --argjson ttl ${data[3]} --argjson priority ${data[4]} --argjson proxy ${data[5]} '{"type":"CNAME","name":$name,"content":$ip,"ttl":$ttl,"priority":$priority,"proxied":$proxy}')
        res=$(curl -s -X PUT "https://api.cloudflare.com/client/v4/zones/$zone_id/dns_records/$dnsrecordid" \
        -H "Authorization: Bearer ${api_key}" \
        --data "$input")
        result=$(echo $res | jq -r '.success')
        echo "Success: $result"
        echo "--------------------------------------------------------"
    fi
}


txt_record (){
    echo "registering ${data[1]}" 
    dnsrecordid=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones/${zone_id}/dns_records?type=TXT&name=${data[1]}.${domain}" \
    -H "Authorization: Bearer ${api_key}" \
    -H "Content-Type: application/json" | jq -r '{"result"}[] | .[0] | .id')

    if [[ $dnsrecordid == "null" ]]
    then
        input=$(jq -n --arg name ${data[1]} --arg content ${data[2]} --argjson ttl ${data[3]} '{"type":"TXT","name":$name,"content":$content,"ttl":$ttl}')
        res=$(curl -s -X POST "https://api.cloudflare.com/client/v4/zones/${zone_id}/dns_records" \
        -H "Authorization: Bearer ${api_key}" \
        --data "$input")
        result=$(echo $res | jq -r '.success')
        echo "Success: $result"
        echo "--------------------------------------------------------"
    else
        input=$(jq -n --arg name ${data[1]} --arg content ${data[2]} --argjson ttl ${data[3]} '{"type":"TXT","name":$name,"content":$content,"ttl":$ttl}')
        res=$(curl -s -X PUT "https://api.cloudflare.com/client/v4/zones/$zone_id/dns_records/$dnsrecordid" \
        -H "Authorization: Bearer ${api_key}" \
        --data "$input")
        result=$(echo $res | jq -r '.success')
        echo "Success: $result"
        echo "--------------------------------------------------------"
    fi
}

mx_record (){
    echo "registering ${data[1]}" 
    dnsrecordid=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones/${zone_id}/dns_records?type=MX&name=${data[1]}" \
    -H "Authorization: Bearer ${api_key}" \
    -H "Content-Type: application/json" | jq -r '{"result"}[] | .[0] | .id')


    if [[ $dnsrecordid == "null" ]]
    then
        input=$(jq -n --arg name ${data[1]} --arg content ${data[2]} --argjson ttl ${data[3]} --argjson priority ${data[4]} '{"type":"MX","name":$name,"content":$content,"ttl":$ttl,"priority":$priority}')
        res=$(curl -s -X POST "https://api.cloudflare.com/client/v4/zones/${zone_id}/dns_records" \
        -H "Authorization: Bearer ${api_key}" \
        --data "$input")
        result=$(echo $res | jq -r '.success')
        echo "Success: $result"
        echo "--------------------------------------------------------"
    else
        input=$(jq -n --arg name ${data[1]} --arg content ${data[2]} --argjson ttl ${data[3]} --argjson priority ${data[4]} '{"type":"MX","name":$name,"content":$content,"ttl":$ttl,"priority":$priority}')
        res=$(curl -s -X PUT "https://api.cloudflare.com/client/v4/zones/$zone_id/dns_records/$dnsrecordid" \
        -H "Authorization: Bearer ${api_key}" \
        --data "$input")
        result=$(echo $res | jq -r '.success')
        echo "Success: $result"
        echo "--------------------------------------------------------"
    fi
}

while IFS= read -r line || [ -n "$line" ]; do
    data=($line)
    case ${data[0]} in
        A)
            a_record $data
            ;;
        CNAME)
            cname_record $data
            ;;
        TXT)
            txt_record $data
            ;;
        MX)
            mx_record $data
            ;;
        \#*)
            continue
            ;;
        "")
            continue
            ;;
        *)
            echo "Unkown record"
            ;;
    esac

done < records.txt

