# 태그 버전 관리 스크립트

# 현재 디렉토리에서 version.txt 파일이 존재하는지 확인
if [ ! -f version.txt ]; then
  echo "2.0" > version.txt  # 파일이 없으면 초기 버전 1.0 설정
fi

# 현재 버전 읽기
VERSION=$(cat version.txt)

# 버전 분해
IFS='.' read -r MAJOR MINOR PATCH <<< "$VERSION"

# 브랜치 이름 확인
BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)

if [ "$BRANCH_NAME" == "dev" ]; then
  # dev 브랜치일 때, 패치 버전 증가
  PATCH=$((PATCH + 1))
elif [ "$BRANCH_NAME" == "main" ]; then
  # main 브랜치일 때, 마이너 버전 증가
  MINOR=$((MINOR + 1))
  PATCH=0  # 패치 버전은 0으로 리셋
fi

# 새 버전 저장
NEW_VERSION="$MAJOR.$MINOR.$PATCH"
echo $NEW_VERSION > version.txt

# Git 태그 추가
git tag "$NEW_VERSION"
git push origin "$NEW_VERSION"
