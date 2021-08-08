-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "resetPasswordToken" TEXT NOT NULL,
    "dateResetPasswordRequest" TIMESTAMP(3),
    "validateEmailToken" TEXT NOT NULL,
    "isEmailValidated" BOOLEAN NOT NULL,
    "name" TEXT NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "NewsGroup" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "name" TEXT NOT NULL,
    "categotyListId" INTEGER NOT NULL,
    "sourceListId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CategoryList" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "tagsListId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TagsList" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SourceList" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "name" TEXT NOT NULL,
    "totalCount" INTEGER NOT NULL,
    "newsSourceId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "NewsSource" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "name" TEXT NOT NULL,
    "count" INTEGER NOT NULL,
    "newsId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "News" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "articleId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Author" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "articleListId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ArticleList" (
    "id" SERIAL NOT NULL,
    "articleId" INTEGER NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Article" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "name" TEXT NOT NULL,
    "authorId" INTEGER NOT NULL,
    "linkToWebSite" TEXT NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_CategoryListToNewsGroup" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_NewsGroupToSourceList" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_CategoryListToTagsList" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_NewsSourceToSourceList" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_NewsToNewsSource" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_ArticleListToAuthor" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_ArticleToArticleList" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "User.email_unique" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "_CategoryListToNewsGroup_AB_unique" ON "_CategoryListToNewsGroup"("A", "B");

-- CreateIndex
CREATE INDEX "_CategoryListToNewsGroup_B_index" ON "_CategoryListToNewsGroup"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_NewsGroupToSourceList_AB_unique" ON "_NewsGroupToSourceList"("A", "B");

-- CreateIndex
CREATE INDEX "_NewsGroupToSourceList_B_index" ON "_NewsGroupToSourceList"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_CategoryListToTagsList_AB_unique" ON "_CategoryListToTagsList"("A", "B");

-- CreateIndex
CREATE INDEX "_CategoryListToTagsList_B_index" ON "_CategoryListToTagsList"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_NewsSourceToSourceList_AB_unique" ON "_NewsSourceToSourceList"("A", "B");

-- CreateIndex
CREATE INDEX "_NewsSourceToSourceList_B_index" ON "_NewsSourceToSourceList"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_NewsToNewsSource_AB_unique" ON "_NewsToNewsSource"("A", "B");

-- CreateIndex
CREATE INDEX "_NewsToNewsSource_B_index" ON "_NewsToNewsSource"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_ArticleListToAuthor_AB_unique" ON "_ArticleListToAuthor"("A", "B");

-- CreateIndex
CREATE INDEX "_ArticleListToAuthor_B_index" ON "_ArticleListToAuthor"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_ArticleToArticleList_AB_unique" ON "_ArticleToArticleList"("A", "B");

-- CreateIndex
CREATE INDEX "_ArticleToArticleList_B_index" ON "_ArticleToArticleList"("B");

-- AddForeignKey
ALTER TABLE "NewsGroup" ADD FOREIGN KEY ("categotyListId") REFERENCES "CategoryList"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NewsGroup" ADD FOREIGN KEY ("sourceListId") REFERENCES "SourceList"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CategoryList" ADD FOREIGN KEY ("tagsListId") REFERENCES "TagsList"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SourceList" ADD FOREIGN KEY ("newsSourceId") REFERENCES "NewsSource"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NewsSource" ADD FOREIGN KEY ("newsId") REFERENCES "News"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "News" ADD FOREIGN KEY ("articleId") REFERENCES "Article"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Author" ADD FOREIGN KEY ("articleListId") REFERENCES "ArticleList"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ArticleList" ADD FOREIGN KEY ("articleId") REFERENCES "Article"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Article" ADD FOREIGN KEY ("authorId") REFERENCES "Author"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CategoryListToNewsGroup" ADD FOREIGN KEY ("A") REFERENCES "CategoryList"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CategoryListToNewsGroup" ADD FOREIGN KEY ("B") REFERENCES "NewsGroup"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_NewsGroupToSourceList" ADD FOREIGN KEY ("A") REFERENCES "NewsGroup"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_NewsGroupToSourceList" ADD FOREIGN KEY ("B") REFERENCES "SourceList"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CategoryListToTagsList" ADD FOREIGN KEY ("A") REFERENCES "CategoryList"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CategoryListToTagsList" ADD FOREIGN KEY ("B") REFERENCES "TagsList"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_NewsSourceToSourceList" ADD FOREIGN KEY ("A") REFERENCES "NewsSource"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_NewsSourceToSourceList" ADD FOREIGN KEY ("B") REFERENCES "SourceList"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_NewsToNewsSource" ADD FOREIGN KEY ("A") REFERENCES "News"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_NewsToNewsSource" ADD FOREIGN KEY ("B") REFERENCES "NewsSource"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ArticleListToAuthor" ADD FOREIGN KEY ("A") REFERENCES "ArticleList"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ArticleListToAuthor" ADD FOREIGN KEY ("B") REFERENCES "Author"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ArticleToArticleList" ADD FOREIGN KEY ("A") REFERENCES "Article"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ArticleToArticleList" ADD FOREIGN KEY ("B") REFERENCES "ArticleList"("id") ON DELETE CASCADE ON UPDATE CASCADE;
