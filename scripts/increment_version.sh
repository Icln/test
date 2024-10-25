# 버전 파일 경로 설정
VERSION_FILE="./version.txt"

# 기존 버전 읽기
if [ -f "$VERSION_FILE" ]; then
    CURRENT_VERSION=$(cat "$VERSION_FILE")
else
    CURRENT_VERSION="1.0.0"  # 버전 파일이 없을 경우 기본 버전
fi

# GITHUB_REF 환경 변수에서 브랜치 확인
if [[ "$GITHUB_REF" == "refs/heads/dev" ]]; then
    # 개발 브랜치에 머지할 때 소수점 증가
    NEW_VERSION=$(echo "$CURRENT_VERSION" | awk -F. -v OFS=. '{$NF++;print}')
else
    # 메인 브랜치에 머지할 때 주 버전 증가
    NEW_VERSION=$(echo "$CURRENT_VERSION" | awk -F. -v OFS=. '{$1++;$2=0;$3=0;print}')
fi

# 새로운 버전 파일에 기록
echo "$NEW_VERSION" > "version.txt"

# 새로운 버전 출력
echo "$NEW_VERSION"
